From: joeyli <jlee@suse.com>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Thu, 13 Sep 2012 18:05:18 +0800
Message-ID: <1347530718.705.23.camel@linux-s257.site>
References: <502BD214.6090700@gnat.ca>  <50516276.7010103@gnat.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:54854 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755225Ab2IMKKd (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 06:10:33 -0400
In-Reply-To: <50516276.7010103@gnat.ca>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Nathanael D. Noblet" <nathanael@gnat.ca>
Cc: jlee@novell.com, platform-driver-x86@vger.kernel.org

Hi Nathanael,=20

=E6=96=BC =E4=B8=89=EF=BC=8C2012-09-12 =E6=96=BC 22:35 -0600=EF=BC=8CNa=
thanael D. Noblet =E6=8F=90=E5=88=B0=EF=BC=9A
> On 08/15/2012 10:45 AM, Nathanael D. Noblet wrote:
> > Hello,
> >
> >    I recently purchased an Acer Aspire One (model A0275-0691). It h=
as an
> > elantech touchpad. As detailed in this bug:
> > https://bugzilla.redhat.com/show_bug.cgi?id=3D848270 the acer-wmi d=
river
> > has two issues on this device.
> >
> > #1) It is sending TOUCHPAD_TOGGLE and simultaneously changing state
> > #2) It disables the touchpad at init
>=20
> So I tested the patch provided here.=20
> https://bugzilla.redhat.com/show_bug.cgi?id=3D848270
>=20
> It definitely allows the Fn+F7 key combo to toggle the use of the=20
> mousepad. Unfortunately the mousepad comes up disabled and is very mu=
ch=20
> confusing the users using the device. Is there somewhere I should loo=
k=20
> for what is causing that? I don't mind helping to debug the issue at =
all=20
> I just don't know where to start.
>=20
> Thanks,

Please try 'ec_raw_mode=3D1' acer-wmi parameter to avoid acer-wmi run
launch manager mode. Run the following statement through root and reboo=
t
system:
	# echo "options acer-wmi ec_raw_mode=3D1" > /etc/modprobe.d/acer-wmi.c=
onf


On the other hand,
I checked your dmideocde on brc#848720, the 0x82 is the RIGHT acpi code
to you for touchpad_toggle key, that means acer-wmi should emit
KEY_TOUCHPAD_TOGGLE to userland. There have another thing also listen
the KEY_TOUCHPAD_TOGGLE and do the change. I checked the
gnome-settings-daemon, it just show up OSD but didn't change touchpad
status.

Could you please help provide the following information?
	+ please attach acpidump:
		# acpidump > acpidump.dat
	+ please help to capture acpi debug log:
		+ please remove ec_raw_mode=3D1 first.
		+ check your kernel parameter need enable: 'CONFIG_ACPI_DEBUG=3Dy'
		+ please add the following kernel parameter and reboot system:
			acpi.debug_level=3D0x0000000F acpi.debug_layer=3D0xffffffff log_buf_=
len=3D5M
		+ after system reboot, please press Fn+F11 (touchpad toggle key) a co=
uple of times.
		+ please attach on dmesg log.

=46or your backlight function key problem, please file another bug on
bugzilla.kernel.org.



Thanks a lot!
Joey Lee
