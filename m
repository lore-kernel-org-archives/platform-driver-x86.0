Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C021713D893;
	Thu, 26 Dec 2024 23:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735255180; cv=none; b=eegjl8UImHg6F12XRnSywV9E40hU5Zc3v9Wla+vdL4lRa3AJwRREMUAXkhH2sMj+WwfUV4TFZznh9zAt06GSurgQFTmysi3Pbvc3/RN+2qjGAr8sfhzslYJgWiI7M8gvdm/Yhmi1Y3NnFwjtulKtFblLWRtPQZsdYuohKm+TgR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735255180; c=relaxed/simple;
	bh=SUOci9nlq4X8+B0qMDju3+lDm290fayEX45zGIcE94Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=L5DbOoNLUh3p/HfncG+DfFkpgY/ZS+qsdr79L71GodpoNCMTqY5alnMeK6Lmvh+r+6kj2yhNTp/RFNGDleGM4yNPaWNJy3ahdEVIGht2uU7KiPXhIjqheaDlMBHL0plW5eQGV10T3Ze2P3+S/lm7BKpSDtHG4ofpcGoLT3fQ2bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=SacbwZtM; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="SacbwZtM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1735255150; x=1735859950; i=w_armin@gmx.de;
	bh=SUOci9nlq4X8+B0qMDju3+lDm290fayEX45zGIcE94Y=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=SacbwZtMYqIeCCw0W/5ntkifCWsmNvI6wVxFwSJFKsry6brtFXPKplfuWz3zVh7i
	 39uOBLUlWARybZYFVuKLEPqAEeix/dccHj5dwWivlX1ELNie/VCzwmf/STzO4lly0
	 AWotBjq75dK7+tG1zSesPFvugqAh/8mOL00xSNr2LQwwnXRI8fPt7V89nN3GraNwL
	 /uCpgG1NKBWQLziy1g3HRmnSfZzC1vPnJ80kvXK2FxZdcK2v45INbnLFcNNt5W4oT
	 icrSeEisGzgOWOJZGKhy+Ug0Ogah/BKDuvudlCCxAyHXpw9xrJCbZJK/wgJPocGEd
	 40qNwfEpXEYFbPhZWg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([91.14.230.110]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MJmKX-1t6osh3CkD-00JHWl; Fri, 27
 Dec 2024 00:19:10 +0100
Message-ID: <eb165321-6a52-4464-bb58-11d8f9ff2008@gmx.de>
Date: Fri, 27 Dec 2024 00:19:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1] platform/x86: Add Lenovo Legion WMI Drivers
To: John Martens <johnfanv2@gmail.com>
Cc: corbet@lwn.net, derekjohn.clark@gmail.com, hdegoede@redhat.com,
 ilpo.jarvinen@linux.intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, luke@ljones.dev, mpearson-lenovo@squebb.ca,
 nijs1@lenovo.com, pgriffais@valvesoftware.com,
 platform-driver-x86@vger.kernel.org, shaohz1@lenovo.com, superm1@kernel.org
References: <a1c25bd8-907f-4b2a-a505-15785eb4b17b@gmx.de>
 <20241226001828.423658-1-johnfanv2@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20241226001828.423658-1-johnfanv2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:oGfj3jXTCWAAPX88JVzuE/CTSx9YEEJ8wh/qROg9JNx4RPh4Qgg
 HVgd5S9PXEhWk499LkTj1SAS1GSBo8dTWMiQ9pLSjxEO/BU/cm6kB9bRgpNdjCdrYXzOakz
 y7EyTmqxT9EVpVK6rb5Qbgi6OK7mZ02Fl6h4t1VVPXT0YffqYpwWnBXXLY6+5M+cxbFfQ3Z
 FDrj7AGupOmOiDMONi43g==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R5dlgzCCw2k=;DP09eB7cEoXu792J/lpCwXs2vOp
 CIAX4JJDPazbTTiTRxK9+QjMq9olEh566auaefcJ5eP4sRdjxiKBZIZOenCBP769SaE9Ljbyb
 xgBUM26oAvu/ebRteNxESYpM+G7XkMFyJGGjDCxgU4G4dSpOb4OClzfqhrbjinEtbsVn1fQga
 0+8f41Wl7CrNMNn8EXEy36Or/FeP9lgwRcaVLwfdhZHcrVvc3lGsbA5EfDc6Wct9b4Cqi0+6M
 cxeVOio7A7ToRs2mt4ENSSmjwVT7VPkeAP/Wpo4SoSVAe+9gD5QzFhfuSEmYII+iOKQb0y8Ar
 jBI0UCiTCC+XMIjf0va2c5lTZ2Nxzcx1hqM1wbJkvCZ3F2TSiHLS6oxCgg5Ie4V9xqfntwrzd
 oGaxT3d5h0EfHX1RVK/KKfr0ge61hcATEKJHlSV3KZRnN4a/C8l4Om3aliHPG8hnTozi95VLb
 m16An2k7tyWzfMibhpYPHpn707TNix7XSHtiN78SIXiHdDr/1ulDmpzozJad/oglMU8lvkNnQ
 r3HxlC4GZv2jkpBnYsqjFiJfdWa1cydHvHerOpgitTWZnf8mCpTkS/Fu6GtCKOc6q/ksAaRsS
 DB4zNitWoPSi0CtByDkae69Pr7WzBMXHbWNMKGipKlBn99HKc8NA17OVRib6uSVYey5aNjuu4
 nW8imav7tBtP/1thabHfDFkHGkahMukeQSqTB7BmmmorkhuUD6fK7gdC0rniTd2k2ROEnGQYq
 1KfLl+hoM4+RA+YYoPgXk/ulWqivbLJbInhCZxcdXw5frL1iD2yyF/GQIRodk7SsACGPb6Wb6
 vRHin7A4TgbvhZTVq+j2nTklBs344dd6ErMX9l5Qu50l7TCpPTHgtxJLEvOY9MCLdFJs7ubS6
 WasukWWQd316WBZvwJR0iBD2pCdiY7mJc+7Emo40tPkqDlnzeVLOq80wIQvl6uiWx58KR51kK
 /eKr6VvTbNDoM2uk8WvsLJvJhs4JgyY0l3tjTa07XYO6hkY+w4W1pBxjAj7SPbDVmO3j6JuWC
 wb32jvfZhkJHuN6PbBQDy+hxbfPqpfY5QZCw5pDUss0Ot6e9Pa/TMnoYpIe7WCkMymVRIR6Eg
 cJ4B/XB/Y0+qhToXTYKlMb9bSYtKvl

Am 26.12.24 um 01:18 schrieb John Martens:

> I guess the most important task is to get following points right because
> they are hard to fix later.
>
> 1. Should there be a unifrom sysfs interface for different access method=
s?
> Depending on the model different methods must be used to control the
> same feature, e.g. the powermode, fan table, dust-cleaning-mode.
> The access methods could be a different WMI method (newer model),
> direct ACPI without WMI, or port mapped IO (outb/inb). I suggest that
> regardless of the access methods it should be produce the same sysfs ent=
ry.
>
> Example: there is a fan-fullspeed-methods/dustcleaning-mode that
> sets the fans to the maximal possible speed. I suggest that regardless o=
f
> the used access method there should be the one file:
>
> /sys/class/firmware-attributes/*/attributes/fanfullspeed/current_value
>
> Alternatively, one could use the less elegant approach:
>
> /sys/class/firmware-attributes/*/attributes/wmi-other-fanfullspeed/curre=
nt_value
> /sys/class/firmware-attributes/*/attributes/wmi-gamezone-fanfullspeed/cu=
rrent_value
> /sys/class/firmware-attributes/*/attributes/acpi1-fanfullspeed/current_v=
alue

The firmware-attribute class interface is only intended for attributes whi=
ch are persistent
and cannot be exposed over other subsystem interfaces.

The "current_value" attribute can be exposed using the hwmon subsystem. Al=
so i assume that
the setting is not persistent across reboots (correct me if i am wrong).

Also depending on the driver the path will be:

/sys/class/firmware-attributes/<name>/attributes/<attr name>/current_value

Because of this i think having a separate interface for each driver is bet=
ter. We can of course harmonize
the naming of the attributes where it makes sense.

>
> 2. Naming and file structure: As mentioned above, there different method=
s -
> including non-WMI methods - are used. Hence, it might not be optimal nam=
e
> the driver "legion-wmi". One idea would be to name the folder/driver "le=
gion"
> and then seperate into multiple files by access methods (WMI by GUID, AC=
PI,
> port mapped IO).
>
> 3. Driver Structure, selection of access method and probing: The right a=
ccess
> method (WMI, ACPI, ...) has to be chosen for each model. Some of them ca=
n
> be automatically probed, some of them have to be hard coded (c.f. also W=
indow
> tools) by the letter-only prefix of the BIOS version.
>
> Depending on the driver structure there are multiple ideas how to manage=
 this i
> nformation:
>
> a: global-access-into-driver-decide-by-enum: initially the driver can st=
ore
> the method of access (WMI, ACPI, ...) for e.g. modifying fanfullspeed as
> an enum/bitfield/... globally. The value can be decided on by probing an=
d
> some hard coded rules. There is one "glovbal" c-file that acts as an
> entrypoint into the driver and adds all the show/store functions. When t=
he
> show-function is called it is decided e.g. by a switch statement which
> function in one of the different files (WMI, ACPI, ...) is called.
> The upside of this method is that if there are not warnings in the code,
> then every case is totally covered. The downside is a lot of boilerplate
> code.
>
> b: global-access-into-driver-decide-by-function-pointer: Same as above
> in case a, but direclty use function pointers instead of enum/bits. Ther=
e
> is one function pointers for each attribute in a "global" struct. When
> the driver is loaded initially, it sets each function pointers to modify
> an attribute the right function for the model. The upside is
> less boilerplate. The downside is that it might get a little
> less safe working with the function pointers.
>
> c: independent-access-in-independent-driver-parts: the driver is split
> into totally independent parts for each method (WMI, ACPI, ...) and GUID=
.
> Each driver part is responsible for creating the sysfs entries. To
> prevent conflicts each part has to use a unique name (see 1)
> for the attribute. Alternatively, the choice of access has to be propaga=
ted
> down to each part to prevent creating the same sysfs attribute multiple
> times. The upside is the elegance and easy extension. The downside
> is the weird sysfs user-interface and the weird coupling between
> the different driver parts.
>
> d: totally independent drivers: make a totally independent driver
> (module) for each access method.

I would prefer approach d. Ideally each driver would use standard subsyste=
m interfaces (hwmon, backlight, firmware-attributes, platform-profile, etc=
)
so that userspace software can be written in a driver-agnostic way.

>
>
> Some more remarks:
> - I would never make one attribute depend on another
> attribute, e.g. when changing some power parameters of GPU/CPU it
> should not change the power mode (e.g. going to custom mode). Initially,
> I did the same but it turned out to be not a good idea. However,
> if one changes some power settings and is not custom-powermode some
> sometimes some weird things happen. Sometimes also all changes are
> ignored by the firmware as seen in the ACPI dissassembly. I guess
> it is best to just manage this in user space.

I agree.

> - When trying to find out what access method to choose one cannot rely
> on the ACPI/WMI interface. From disassembling the ACPI, one can see
> that sometimes/often even if the function is not implemented it
> will return without error. Moreover, there are some WMI methods
> with name "*IsSupported" (or similar) but they often do not tell
> the truth.

Oh no.

I hope that we just misinterpret the result of those methods. Otherwise th=
is would indeed be
very frustrating. Maybe some help from Lenovo can solve this issue.

Thanks,
Armin Wolf

> - Using just one WMI interface is simple =E2=80=94 my grandmother could =
do it.
> However, when juggling and organizing the various access methods, your
> guidance is needed to set the driver on the right path from the beginnin=
g.
> So I defenitely, appreciate your input on the different options.
