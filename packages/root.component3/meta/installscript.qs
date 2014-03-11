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

    // add an extract operation with a modified path
    component.addOperation("Extract", archive, "@HomeDir@");
	component.addOperation("Move", "@HomeDir@/exaro.exe", "@TargetDir@/faocas_suite/release/exaro.exe")
	//component.addOperation("Move", "@HomeDir@/Report.dll", "@TargetDir@/faocas_suite/release/Report.dll")
	component.addOperation("Mkdir", "@TargetDir@/faocas_suite/PropertyEditor")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/BoolProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/BoolProperty.dll")
	component.addOperation("Move", "@HomeDir@/PropertyEditor/DateProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/DateProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/FlagsProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/FlagsProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/PenProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/PenProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/RectProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/RectProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/StringListProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/StringListProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/StringsProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/StringsProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/SizefProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/SizefProperty.dll")
	component.addOperation("Move", "@HomeDir@/PropertyEditor/PixmapProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/PixmapProperty.dll")
	component.addOperation("Move", "@HomeDir@/PropertyEditor/FontProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/FontProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/DateTimeProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/DateTimeProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/BrushProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/BrushProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/ColorProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/ColorProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/EnumsProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/EnumsProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/NumbersProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/NumbersProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/RectfProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/RectfProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/SizeProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/SizeProperty.dll")	
	component.addOperation("Move", "@HomeDir@/PropertyEditor/TimeProperty.dll", "@TargetDir@/faocas_suite/PropertyEditor/TimeProperty.dll")	
	component.addOperation("Rmdir", "@HomeDir@/PropertyEditor")
	component.addOperation( "CreateShortcut", "@TargetDir@/faocas_suite/release/exaro.exe", "@StartMenuDir@/Exaro.lnk" )
	//component.addOperation("CreateDesktopEntry", "@TargetDir@/faocas_suite/release/exaro.exe", ["Type=Application", "Name=Exaro", "Exec=@TargetDir@/faocas_suite/release/exaro.exe","Terminal=false"]);	
}
