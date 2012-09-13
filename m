From: joeyli <jlee@suse.com>
Subject: Re: Acer-WMI disables touchpad and other issues
Date: Fri, 14 Sep 2012 03:25:43 +0800
Message-ID: <1347564343.705.28.camel@linux-s257.site>
References: <502BD214.6090700@gnat.ca>  <50516276.7010103@gnat.ca>
	 <1347530718.705.23.camel@linux-s257.site>  <5051FB6F.508@gnat.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from smtp.nue.novell.com ([195.135.221.5]:58550 "EHLO
	smtp.nue.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752410Ab2IMTbN (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Thu, 13 Sep 2012 15:31:13 -0400
In-Reply-To: <5051FB6F.508@gnat.ca>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: "Nathanael D. Noblet" <nathanael@gnat.ca>
Cc: jlee@novell.com, platform-driver-x86@vger.kernel.org

=E6=96=BC =E5=9B=9B=EF=BC=8C2012-09-13 =E6=96=BC 09:27 -0600=EF=BC=8CNa=
thanael D. Noblet =E6=8F=90=E5=88=B0=EF=BC=9A
> So far I've added the options acer-wmi ec_raw_mode=3D1 to a modprobe.=
d=20
> conf file. Looking at /sys/modules/acer_wmi/parameters/ec_raw_mode=20
> contains a Y. The mousepad remains unresponsive on boot prior to a=20
> Fn+F7. I've added options acer_wmi ec_raw_mode=3D1 (note the acer_wmi=
 vs=20
> acer-wmi) simply because the sysmodule was also underscore. There is =
no=20
> difference, the module parameter is recorded as Y and the mousepad st=
ill=20
> does not work on boot.
>=20
> I will provide the other requested information soon.

Thanks for your testing, then we need to see DSDT and acpi debug log
when load acer-wmi.


Thanks
Joey Lee

>=20
> On 09/13/2012 04:05 AM, joeyli wrote:
> > Hi Nathanael,
> >
> > =E6=96=BC =E4=B8=89=EF=BC=8C2012-09-12 =E6=96=BC 22:35 -0600=EF=BC=8C=
Nathanael D. Noblet =E6=8F=90=E5=88=B0=EF=BC=9A
> >> On 08/15/2012 10:45 AM, Nathanael D. Noblet wrote:
> >>> Hello,
> >>>
> >>>     I recently purchased an Acer Aspire One (model A0275-0691). I=
t has an
> >>> elantech touchpad. As detailed in this bug:
> >>> https://bugzilla.redhat.com/show_bug.cgi?id=3D848270 the acer-wmi=
 driver
> >>> has two issues on this device.
> >>>
> >>> #1) It is sending TOUCHPAD_TOGGLE and simultaneously changing sta=
te
> >>> #2) It disables the touchpad at init
> >>
> >> So I tested the patch provided here.
> >> https://bugzilla.redhat.com/show_bug.cgi?id=3D848270
> >>
> >> It definitely allows the Fn+F7 key combo to toggle the use of the
> >> mousepad. Unfortunately the mousepad comes up disabled and is very=
 much
> >> confusing the users using the device. Is there somewhere I should =
look
> >> for what is causing that? I don't mind helping to debug the issue =
at all
> >> I just don't know where to start.
> >>
> >> Thanks,
> >
> > Please try 'ec_raw_mode=3D1' acer-wmi parameter to avoid acer-wmi r=
un
> > launch manager mode. Run the following statement through root and r=
eboot
> > system:
> > 	# echo "options acer-wmi ec_raw_mode=3D1" > /etc/modprobe.d/acer-w=
mi.conf
> >
> >
> > On the other hand,
> > I checked your dmideocde on brc#848720, the 0x82 is the RIGHT acpi =
code
> > to you for touchpad_toggle key, that means acer-wmi should emit
> > KEY_TOUCHPAD_TOGGLE to userland. There have another thing also list=
en
> > the KEY_TOUCHPAD_TOGGLE and do the change. I checked the
> > gnome-settings-daemon, it just show up OSD but didn't change touchp=
ad
> > status.
> >
> > Could you please help provide the following information?
> > 	+ please attach acpidump:
> > 		# acpidump > acpidump.dat
> > 	+ please help to capture acpi debug log:
> > 		+ please remove ec_raw_mode=3D1 first.
> > 		+ check your kernel parameter need enable: 'CONFIG_ACPI_DEBUG=3Dy=
'
> > 		+ please add the following kernel parameter and reboot system:
> > 			acpi.debug_level=3D0x0000000F acpi.debug_layer=3D0xffffffff log_=
buf_len=3D5M
> > 		+ after system reboot, please press Fn+F11 (touchpad toggle key) =
a couple of times.
> > 		+ please attach on dmesg log.
> >
> > For your backlight function key problem, please file another bug on
> > bugzilla.kernel.org.
> >
> >
> >
> > Thanks a lot!
> > Joey Lee
> >
> >
>=20
>=20
