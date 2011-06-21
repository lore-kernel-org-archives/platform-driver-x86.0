From: Seth Forshee <seth.forshee@canonical.com>
Subject: Re: acer-wmi problem handling device states from WMI events
Date: Tue, 21 Jun 2011 11:58:59 -0500
Message-ID: <20110621165859.GB25609@thinkpad-t410>
References: <4E00FC26020000230002E847@novprvlin0050.provo.novell.com>
 <20110621131442.GA25609@thinkpad-t410>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from adelie.canonical.com ([91.189.90.139]:40532 "EHLO
	adelie.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753673Ab1FUQ7F (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Tue, 21 Jun 2011 12:59:05 -0400
Content-Disposition: inline
In-Reply-To: <20110621131442.GA25609@thinkpad-t410>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Joey Lee <jlee@novell.com>
Cc: platform-driver-x86@vger.kernel.org

On Tue, Jun 21, 2011 at 08:14:42AM -0500, Seth Forshee wrote:
> On Tue, Jun 21, 2011 at 04:16:38AM -0600, Joey Lee wrote:
> > Hi Seth,=20
> >=20
> > =E6=96=BC =E4=B8=80=EF=BC=8C2011-06-20 =E6=96=BC 14:06 -0500=EF=BC=8C=
Seth Forshee =E6=8F=90=E5=88=B0=EF=BC=9A
> > > Hi Joey,
> > >=20
> > > acer-wmi is indiscriminately using the device state from hotkey e=
vents
> > > to update the various rfkill states. On the Aspire 1830 this can =
result
> > > in a soft block on the wlan when the touchpad hotkey is pressed, =
as it
> > > is reporting a non-zero device state that does not reflect the wi=
reless
> > > status.
> > >=20
> >=20
> > Thank's for you found out this issue, I didn't meet it because touc=
hpad
> > hotkey didn't emit any wmi event on my Acer TravelMate 8572.=20
> >=20
> > I will double check it.
> >=20
> > > I beleive the following (untested) patch is a roughly correct fix=
 for
> > > this issue.  It changes acer-wmi to only update the rfkill states=
 when
> > > the appropriate hotkeys are pressed, but I'm a little unsure abou=
t the
> > > way I've split out the rfkill updates acording to the hotkeys. I =
don't
> > > see any support in the driver for a 3G hotkey, so I've grouped it=
 with
> > > the wlan key, and I have split out bluetooth to be handled separa=
tely
> > > from these. Does this patch look correct?
> > >=20
> > > Thanks,
> > > Seth
> > >=20
> >=20
> > Yes, I thought your patch can avoid acer-wmi update killswitch stat=
e
> > base on the result from non-Communication button.
> >=20
> > On some Acer machines only have one wireless key, the key only emit
> > KEY_WIRELESS but EC updates 3 communication devices' states, I thou=
ght
> > we can direct update 3 killswitch state when received KEY_WLAN or
> > KEY_BLUETOOTH. maybe like this:
> >=20
> > +			switch (key->keycode) {
> > +			case KEY_WLAN:
> > +			case KEY_BLUETOOTH:
> > +				if (has_cap(ACER_CAP_WIRELESS))
> > +					rfkill_set_sw_state(wireless_rfkill,
> > +						!(device_state & ACER_WMID3_GDS_WIRELESS));
> > +				if (has_cap(ACER_CAP_THREEG))
> > +					rfkill_set_sw_state(threeg_rfkill,
> > +						!(device_state & ACER_WMID3_GDS_THREEG));
> > +				if (has_cap(ACER_CAP_BLUETOOTH))
> > +					rfkill_set_sw_state(bluetooth_rfkill,
> > +						!(device_state & ACER_WMID3_GDS_BLUETOOTH));
> > +				break;
> > +			}
> > +			sparse_keymap_report_entry(acer_wmi_input_dev, key,
> > +						   1, true);
> >=20
> > Of course need more testing on my and your Acer machines.
> > I will double check this patch on my TravelMate 8572 then reply res=
ult
> > on this mail tomorrow.
>=20
> That is the other way I was thinking of doing this, but I wasn't sure
> which was correct, and the machine in question doesn't have bluetooth
> for me to test. Based on your explanation I think doing it as above i=
s
> best.
>=20
> I'll get some testing with the version above, and if it tests well fo=
r
> both of us I will send an updated patch plus one other patch to suppo=
rt
> the wlan hotkey on the 1830. I don't personally have this machine so =
it
> may be a few days before I receive results back from my tester.

I got test results back already, and the patch is working. I'll follow
up with both patches, that way if they work fine in your testing you ca=
n
go ahead and take them.

Thanks!
Seth
