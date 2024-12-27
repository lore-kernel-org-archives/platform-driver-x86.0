Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B12C8DF;
	Fri, 27 Dec 2024 23:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735341539; cv=none; b=Nb1EK3tmStskRaitMlMrd6k5ZhZrClvKksbRLFcu9C9OG5ytAMc3toOhF/8yO5QUbWVwI1mfe2332RY3UyOTHyA/4Pl9jaYcwqHhpgGHlphUQBhXnMWLaHEopMk5YgUsEX7Z74Qyjsgp4MplsFx4cl/m7uUuje5IUSStIkqz8Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735341539; c=relaxed/simple;
	bh=PIaUEXIOVyeZXpP5uFRKxu6ybYfD17WkqdUZ5MErV0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uGXj1oZ8lggw8ZwolNDjGsjo0PdZrZmVmsdlDg0mrikrkY9+bbew4UiTfnYTjFoEpuwfHBJr3ZMm+faw1gjbcSvWnWPFCbNHSKZtfH8StCX6J3+H00UXQ78l0w5idVA7e4kGndxw4qiMGu4m7kgETPYWUE949/Oqi4kFBzGWf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FqTjz8uY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FqTjz8uY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46772a0f85bso63300101cf.3;
        Fri, 27 Dec 2024 15:18:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735341536; x=1735946336; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PIaUEXIOVyeZXpP5uFRKxu6ybYfD17WkqdUZ5MErV0Q=;
        b=FqTjz8uYki2WfylNBZngaEKp8LXP8NBMjhG1YmE1uo8OqLG5hdBhz9Bzj5lZyj0BW7
         yeIW23l4w0Dnwga5L5C7mhLumneNkt1zl8gUuodaPAahOsUaBYPiGhc+eGrIX/4FWmjn
         tbcsGtOTnYDzjF4yXFszQAtdKcCq16WN806WtcB1jmG5DRIMrJpxxhVHVgelIwNn2SOW
         pQMu/l2y4YjBBEVgKGV1aX/XVX4oxX8UzFLkejCpQ7jncOireFsePT/7EPqDebHckYXR
         rrS2aL18o6nqoZu3OX2yfmDTUtYSec064XDUg63QWDZWgJZm4DRVTBguljAZkGg6zuiV
         UPKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735341536; x=1735946336;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PIaUEXIOVyeZXpP5uFRKxu6ybYfD17WkqdUZ5MErV0Q=;
        b=pZCbtCckYqIz81KiJ+a56Y/lpcTuNQyG2j901RIFbpMNp4ZDBQZV049AtWJUrYcd5B
         LNIXAkfRdxOjJ7/8U2esvPFMhQMBmTmGtUUMgYsJ1SNtZAjQBZuHbp6MHJHs/JNS5nTx
         qc9kEvwWOw/ZQhR+RnY9kCNG4qXs6g2ejMMR27YfMmmp2ByATIMUSdboaMA2+2z17czA
         BiQvVEGSB00JkF9CDQ5i0YZD/GXt00HHEPHFlO8odZajK/q+uhGOnE1yMugzEP/GMVH0
         fdYSabX4/V2VtVoR2G4Jc10NHA6ATt4rli+fdTaMmLvpqPgbVRcJBYccDRpIvL5o3S7z
         mGfg==
X-Forwarded-Encrypted: i=1; AJvYcCW5SjR0vq+EqTAUEEcfoyzugX4WECjidNYpJM61gSbCbyEfBpGg4Cf1adRL62DcCihn76mYdlEX9vc=@vger.kernel.org, AJvYcCXXjBawza7R4TSAm6loPdjn87yxG07sgmFQ/f799VmCgpBR4/uxXsLQPDFkrrvljw6WBORjQy/LETQ0Hu0l@vger.kernel.org, AJvYcCXcl3y6KoqZa2AsGW0C6H0nryN8JauY4i7uEu2p+w7p3iV1kUq4Vfc7v1t6UvsZ6pj2xptyunCyxBPXohaFl4BeCOIIAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjCEAgUCU04V11khCR+DGQUO/w3UFZWs9NgiqMv7g58g+yO8XH
	X53V0nIta4P9erSsHBwvJrh9xxdIfN+jlFY1cq96ETJ+fWHnPmfdkRoZssze2vXBTS1uC+LsX4p
	mRtLMvwUiCztnJwGx0dLf7ky0xDM=
X-Gm-Gg: ASbGncsELV6YGiJHsKJAH4bpCuTA8TZ/pqk1iVDWFFUNRfi8eXlZBd2Bj/2zrDGZUt+
	D+NFTUCPNfQOrYtr8li89ClG9AWI5KOa0SCWVNu0=
X-Google-Smtp-Source: AGHT+IE/pe3BQ/jUHqYiTeDxFGa9rcFx4puyT9MikRCWMv/GP3ykeazMIEYNZ/Z+37+A0ps6yxrE9B7AHwABOSQFblY=
X-Received: by 2002:ad4:5aaa:0:b0:6d8:838f:8b54 with SMTP id
 6a1803df08f44-6dd2339ff7fmr429264746d6.39.1735341536060; Fri, 27 Dec 2024
 15:18:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a1c25bd8-907f-4b2a-a505-15785eb4b17b@gmx.de> <20241226001828.423658-1-johnfanv2@gmail.com>
In-Reply-To: <20241226001828.423658-1-johnfanv2@gmail.com>
From: Derek John Clark <derekjohn.clark@gmail.com>
Date: Fri, 27 Dec 2024 15:18:45 -0800
Message-ID: <CAFqHKTna+kJpHLo5s4Fm1TmHcSSqSTr96JHDm0DJ0dxsZMkixA@mail.gmail.com>
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: John Martens <johnfanv2@gmail.com>
Cc: w_armin@gmx.de, corbet@lwn.net, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, luke@ljones.dev, mpearson-lenovo@squebb.ca, 
	nijs1@lenovo.com, pgriffais@valvesoftware.com, 
	platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 25, 2024 at 4:18=E2=80=AFPM John Martens <johnfanv2@gmail.com> =
wrote:

>I guess the most important task is to get following points right because
>they are hard to fix later.
>
>1. Should there be a unifrom sysfs interface for different access methods?
>Depending on the model different methods must be used to control the
>same feature, e.g. the powermode, fan table, dust-cleaning-mode.
>The access methods could be a different WMI method (newer model),
>direct ACPI without WMI, or port mapped IO (outb/inb). I suggest that
>regardless of the access methods it should be produce the same sysfs entry=
.
>

>Example: there is a fan-fullspeed-methods/dustcleaning-mode that
>sets the fans to the maximal possible speed. I suggest that regardless of
>the used access method there should be the one file:
>
>/sys/class/firmware-attributes/*/attributes/fanfullspeed/current_value
>
>Alternatively, one could use the less elegant approach:
>
>/sys/class/firmware-attributes/*/attributes/wmi-other-fanfullspeed/current=
_value
>/sys/class/firmware-attributes/*/attributes/wmi-gamezone-fanfullspeed/curr=
ent_value
>/sys/class/firmware-attributes/*/attributes/acpi1-fanfullspeed/current_val=
ue

I agree generally, though there are some limitations. As Armin mentioned, t=
he
firmware-attributes interface will handle this with the pattern
/sys/class/firmware-attributes/<name>. <name> is derived when the class is
initialized. In v1 I used lenovo-legion-wmi but based on the discussion so =
far
I'll likely drop legion from all patterns and call everything based on its =
GUID
plain text name like Mark suggested, lenovo-wmi-other for Other Method,
lenovo-wmi-custom for Custom Method, etc. That will ensure two things:
(1) drivers won't conflict in namespace if there is an unused but present i=
n
the bios older interface on a newer device.
(2) Userspace apps can determine the preferred interface for a given device=
 if
more than one happens to be present. I don't think this will be very common=
,
but it can be handled if it does happen.

The goal of this driver, jointly with asus-armoury, is to standardize the
features that aren't already in the kernel while utilizing those that are. =
I.E.
AMD PPT doesn't yet have a standard interface, platform-profile does. The n=
ames
of the attributes that provide specific functionality will remain the same
between drivers (ppt_pl1_spl for example). As firmware-attributes is a clas=
s,
it is easy to use udev in userspace apps to avoid hard coding paths so that=
 any
interface that provides these attributes will be interchangeable or include=
 a
hierarchy table. In the event more than one "competing" driver loads the
userspace app can prioritize a specific interface and, if a genuine conflic=
t
arises between two drivers on a specific device, it will be easy enough to
quirk that device to not load one or the other. The fanfullspeed attribute
should be able to follow this same pattern when implemented.

>2. Naming and file structure: As mentioned above, there different methods =
-
>including non-WMI methods - are used. Hence, it might not be optimal name
>the driver "legion-wmi". One idea would be to name the folder/driver "legi=
on"
>and then seperate into multiple files by access methods (WMI by GUID, ACPI=
,
>port mapped IO).

Since each driver will be independent I don't see this being a problem.
lenovo-acpi-tunables or lenovo-i2c-tunables (as example) could coexist.
As above, each firmware-attributes path will be different but the attribute=
s
within them would be standardized.

>3. Driver Structure, selection of access method and probing: The right acc=
ess
>method (WMI, ACPI, ...) has to be chosen for each model. Some of them can
>be automatically probed, some of them have to be hard coded (c.f. also Win=
dow
>tools) by the letter-only prefix of the BIOS version.
>
>Depending on the driver structure there are multiple ideas how to manage t=
his i
>nformation:
>
>a: global-access-into-driver-decide-by-enum: initially the driver can stor=
e
>the method of access (WMI, ACPI, ...) for e.g. modifying fanfullspeed as
>an enum/bitfield/... globally. The value can be decided on by probing and
>some hard coded rules. There is one "glovbal" c-file that acts as an
>entrypoint into the driver and adds all the show/store functions. When the
>show-function is called it is decided e.g. by a switch statement which
>function in one of the different files (WMI, ACPI, ...) is called.
>The upside of this method is that if there are not warnings in the code,
>then every case is totally covered. The downside is a lot of boilerplate
>code.
>
>b: global-access-into-driver-decide-by-function-pointer: Same as above
>in case a, but direclty use function pointers instead of enum/bits. There
>is one function pointers for each attribute in a "global" struct. When
>the driver is loaded initially, it sets each function pointers to modify
>an attribute the right function for the model. The upside is
>less boilerplate. The downside is that it might get a little
>less safe working with the function pointers.
>
>c: independent-access-in-independent-driver-parts: the driver is split
>into totally independent parts for each method (WMI, ACPI, ...) and GUID.
>Each driver part is responsible for creating the sysfs entries. To
>prevent conflicts each part has to use a unique name (see 1)
>for the attribute. Alternatively, the choice of access has to be propagate=
d
>down to each part to prevent creating the same sysfs attribute multiple
>times. The upside is the elegance and easy extension. The downside
>is the weird sysfs user-interface and the weird coupling between
>the different driver parts.
>
>d: totally independent drivers: make a totally independent driver
>(module) for each access method.
>
>Some more remarks:
>- I would never make one attribute depend on another
>attribute, e.g. when changing some power parameters of GPU/CPU it
>should not change the power mode (e.g. going to custom mode). Initially,
>I did the same but it turned out to be not a good idea. However,
>if one changes some power settings and is not custom-powermode some
>sometimes some weird things happen. Sometimes also all changes are
>ignored by the firmware as seen in the ACPI dissassembly. I guess
>it is best to just manage this in user space.

I think that is the consensus going forward. In v2 each interface will be
independent of the others except when it relies on a WMI data block as part=
 of
its data validation.

>- When trying to find out what access method to choose one cannot rely
>on the ACPI/WMI interface. From disassembling the ACPI, one can see
>that sometimes/often even if the function is not implemented it
>will return without error. Moreover, there are some WMI methods
>with name "*IsSupported" (or similar) but they often do not tell
>the truth.

Generally I prefer to use the path of least intervention and automatic
discovery with explicit deny lists, then explicit allow lists if needed. Th=
at
will limit the amount of work needed to support new hardware that implement=
s
the same functionality. WMI interfaces for example should load automaticall=
y,
unless there is a restrictive DMI quirk for a specific model. If BIOS revis=
ion
is of concern then that driver will quirk an alternative method or deny the
driver overall. If automatic discovery isn't an option, such as EC writes w=
ith
inb/outb, then we would explicitly load it using a DMI table in that driver=
.
From my experience this seems to be the standard for kernel drivers. We wil=
l
need to rely on your historical data and Lenovo to get this right.

>- Using just one WMI interface is simple =E2=80=94 my grandmother could do=
 it.
>However, when juggling and organizing the various access methods, your
>guidance is needed to set the driver on the right path from the beginning.
>So I defenitely, appreciate your input on the different options.

Thanks John,
Derek
