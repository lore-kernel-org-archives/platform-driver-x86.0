From: Mihai =?UTF-8?B?RG9uyJt1?= <mihai.dontu@gmail.com>
Subject: Re: [b43] usb device disconnects automatically after 1s
Date: Sat, 2 Apr 2011 18:44:50 +0300
Message-ID: <20110402184450.2ef19d7b@mdontu-dell>
References: <201103170018.32061.mihai.dontu@gmail.com>
 <201103170022.24290.mihai.dontu@gmail.com>
 <AANLkTi=-B0e4VT_v+F23Q+hG_zn=JnVbmVHnFpETVrZu@mail.gmail.com>
 <201103170106.58746.mihai.dontu@gmail.com>
 <4D81FA730200002300029F0F@novprvlin0050.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4D81FA730200002300029F0F@novprvlin0050.provo.novell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Joey Lee <jlee@novell.com>
Cc: zajec5@gmail.com, linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org, platform-driver-x86@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Wed, 16 Mar 2011 19:11:31 -0600
"Joey Lee" <jlee@novell.com> wrote:

> Add Cc. to platform driver guys.
>=20
> =E6=96=BC =E5=9B=9B=EF=BC=8C2011-03-17 =E6=96=BC 01:06 +0200=EF=BC=8C=
Mihai Don=C8=9Bu =E6=8F=90=E5=88=B0=EF=BC=9A
> > On Thursday 17 March 2011 00:35:02 Rafa=C5=82 Mi=C5=82ecki wrote:
> > > 2011/3/16 Mihai Don=C8=9Bu <mihai.dontu@gmail.com>:
> > > > Added linux-usb and linux-wireless to CC.
> > > >=20
> > > > On Thursday 17 March 2011 00:18:31 Mihai Don=C8=9Bu wrote:
> > > >> Hi,
> > > >>=20
> > > >> I have just upgraded to 2.6.38 and discovered that I can't use
> > > >> my wireless device (BCM4312 802.11a/b/g). I press Fn + F2, the
> > > >> bluetooth led lights and after a second it turns off by
> > > >> itself. In dmesg I'm seeing the following:
> > > >>=20
> > > >> [   88.167212] usb 1-2.2: new full speed USB device using
> > > >> ehci_hcd and address 5
> > > >> [   88.782330] usb 1-2.2: USB disconnect, address 5
> > > >>=20
> > > >> I switched to 2.6.37 until I'll have some time to bisect this.
> > > >> In the mean time I have attached the output of lspci,
> > > >> interrupts and dmesg.
> > >=20
> > > I suspect it's WMI related. What is your machine?
> >=20
> > It's a Dell Latitude D520 but I can't find a link with full specs
> > (in English).
> >=20
> > > Please check:
> > > https://bugzilla.kernel.org/show_bug.cgi?id=3D31002
> > > http://comments.gmane.org/gmane.linux.acpi.devel/49577
> > >=20
> > > I can't help you more, I just noticed such a issue reported on
> > > ACPI ML, you have to dig into this yourself (or someone else may
> > > help you).
> >=20
> > Thanks for the links. I'll see if I can get anywhere from there.

Today I had some time on my hands and decided to get this working.
Which I did. So the difference between 2.6.37 and 2.6.38 is that now I
have to invoke rfkill to enable my wireless device, because pressing
=46n + F2 toggles the hard and soft lock states of the device _but_ onl=
y
to 'yes'. Pressing the key combination again will only remove the hard
lock. On 2.6.37 it would remove both. For example:

On 2.6.37:
# rfkill list 0               # wifi disabled
0: dell-wifi: Wireless LAN
        Soft blocked: yes
        Hard blocked: yes

# rfkill list 0               # wifi enabled (via Fn + F2)
0: dell-wifi: Wireless LAN
        Soft blocked: no
        Hard blocked: no

(rfkill events)
1301758599.537508: idx 0 type 1 op 2 soft 0 hard 0
1301758600.561087: idx 2 type 1 op 2 soft 0 hard 0

On 2.6.38:
# rfkill list 0               # wifi disabled
0: dell-wifi: Wireless LAN
        Soft blocked: yes
        Hard blocked: yes

# rfkill list 0               # wifi enabled (via Fn + F2)
0: dell-wifi: Wireless LAN
        Soft blocked: yes
        Hard blocked: no

(rfkill events)
1301758830.251541: idx 0 type 1 op 2 soft 1 hard 0

Is there supposed to be a piece of software that listens for these
events and toggles the soft state whenever the hard state changes?

Thanks,

--=20
Mihai Don=C8=9Bu
