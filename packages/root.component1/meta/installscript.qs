/**************************************************************************
**
** Copyright (C) 2013 Digia Plc and/or its subsidiary(-ies).
** Contact: http://www.qt-project.org/legal
**
** This file is part of the Qt Installer Framework.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and Digia.  For licensing terms and
** conditions see http://qt.digia.com/licensing.  For further information
** use the contact form at http://qt.digia.com/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 2.1 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU Lesser General Public License version 2.1 requirements
** will be met: http://www.gnu.org/licenses/old-licenses/lgpl-2.1.html.
**
** In addition, as a special exception, Digia gives you certain additional
** rights.  These rights are described in the Digia Qt LGPL Exception
** version 1.1, included in the file LGPL_EXCEPTION.txt in this package.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3.0 as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL included in the
** packaging of this file.  Please review the following information to
** ensure the GNU General Public License version 3.0 requirements will be
** met: http://www.gnu.org/copyleft/gpl.html.
**
**
** $QT_END_LICENSE$
**
**************************************************************************/

function Component()
{
    // constructor
}

Component.prototype.createOperationsForArchive = function(archive)
{
    // don't use the default operation
    // component.createOperationsForArchive(archive);
	
	appdata=installer.environmentVariable("APPDATA")
    component.addOperation("AppendFile", appdata+"\\postgresql\\pgpass.conf", "localhost:9001:*:postgres:test123")

    // add an extract operation with a modified path	
    component.addOperation("Extract", archive, "@TargetDir@");
	component.addOperation("Mkdir", "@TargetDir@/postgreSQL/9.3/data")
	component.addOperation("Execute", ["@TargetDir@/postgreSQL/9.3/bin/initdb.exe", "-D", "@TargetDir@/postgreSQL/9.3/data", "-E", "UTF8", "--locale=en_US.UTF-8", "-U", "postgres", "-A", "md5", "--pwfile=@TargetDir@/postgreSQL/9.3/pass.txt"])		



if (installer.value("os") == "win"){
	component.addElevatedOperation("Execute", ["@TargetDir@/postgreSQL/9.3/create_service.bat", "@TargetDir@/postgreSQL/9.3/data", "@TargetDir@/postgreSQL/9.3/bin/", "UNDOEXECUTE", "@TargetDir@/postgreSQL/9.3/bin/pg_ctl.exe", "-o", "\"-p 9001\"", "unregister", "-S", "auto", "-D", "@TargetDir@/postgreSQL/9.3/data", "errormessage=Could not register/unregister PostgreSQL service!"])
}
								
	component.addOperation("Execute", ["{0,1}", "@TargetDir@/postgreSQL/9.3/bin/pg_ctl.exe", "-U", "postgres", "-P", "test123", "-o", "\"-p 9001\"", "start", "-D", "@TargetDir@/postgreSQL/9.3/data", "-l","@TargetDir@/postgreSQL/9.3/log.txt", "UNDOEXECUTE", "@TargetDir@/postgreSQL/9.3/bin/pg_ctl.exe", "-o","\"-p 9001\"", "stop", "-D", "@TargetDir@/postgreSQL/9.3/data","errormessage=Could not start/stop PostgreSQL server!"])
	component.addOperation("Execute", "@TargetDir@/postgreSQL/9.3/bin/createdb.exe", "-p", "9001", "-U", "postgres", "-E", "UTF8", "-T", "template0", "faocasdata", "UNDOEXECUTE", "@TargetDir@/postgreSQL/9.3/bin/dropdb.exe","-p", "9001", "-U", "postgres", "faocasdata")
	component.addOperation("Execute", ["{0,1}", "@TargetDir@/postgreSQL/9.3/bin/pg_restore.exe", "-p", "9001", "-U", "postgres", "--dbname=faocasdata", "-C", "@TargetDir@/postgreSQL/9.3/faocasdata.tar","errormessage=There was an error related with the locale; please ignore this"])
	
	//component.addElevatedOperation("EnvironmentVariable", "PGPASSWORD", "", true)	
			
    component.addOperation("AppendFile", "@TargetDir@/run_confapp.bat", "@echo off \n")		
    component.addOperation("AppendFile", "@TargetDir@/run_confapp.bat", "set PATH=%PATH%;@TargetDir@\\faocas_suite\\release;@TargetDir@\\postgreSQL\\9.3\\bin; \n")		
    component.addOperation("AppendFile", "@TargetDir@/run_confapp.bat", "start @TargetDir@\\faocas_suite\\release\\confapp.exe \n")		
	
    component.addOperation("AppendFile", "@TargetDir@/run_faocas.bat", "@echo off \n")		
    component.addOperation("AppendFile", "@TargetDir@/run_faocas.bat", "set PATH=%PATH%;@TargetDir@\\faocas_suite\\release;@TargetDir@\\postgreSQL\\9.3\\bin; \n")		
    component.addOperation("AppendFile", "@TargetDir@/run_faocas.bat", "start @TargetDir@\\faocas_suite\\release\\faocas.exe \n")		
		
}
