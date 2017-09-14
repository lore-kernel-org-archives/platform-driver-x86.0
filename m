From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: keyboard backlight max_brightness bug on Dell Latitude E6410
Date: Thu, 14 Sep 2017 10:06:59 +0200
Message-ID: <20170914080659.GL32278@pali>
References: <20170911232527.669a95d04dbb6b53be537852cb8ecb8c.c30a078964.wbe@email22.secureserver.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20170911232527.669a95d04dbb6b53be537852cb8ecb8c.c30a078964.wbe@email22.secureserver.net>
Sender: linux-kernel-owner@vger.kernel.org
To: "Gabriel M. Elder" <gabriel@tekgnowsys.com>
Cc: dvhart@infradead.org, andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Monday 11 September 2017 23:25:27 Gabriel M. Elder wrote:
> <html><body><span style=3D"font-family:Verdana; color:#000; font-size:10p=
t;"><div>Hi all,</div><div><br></div><div>Hans de Goede, one of the upower =
maintainers, suggested I alert you all to this bug:</div><div><br></div><di=
v><a href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100041" mce_hre=
f=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100041" title=3D"https:=
//bugs.freedesktop.org/show_bug.cgi?id=3D100041" target=3D"_blank">https://=
bugs.freedesktop.org/show_bug.cgi?id=3D100041</a><br></div><div><br></div><=
div>and the new one I filed via the kernel bugzilla:</div><div><br></div><d=
iv><a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D196913" mce_hre=
f=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D196913" title=3D"https:/=
/bugzilla.kernel.org/show_bug.cgi?id=3D196913" target=3D"_blank">https://bu=
gzilla.kernel.org/show_bug.cgi?id=3D196913</a><br></div><div><br></div><div=
>"<span id=3D"summary_container"><span id=3D"short_desc_nonedit_display">ke=
yboard backlight max_brightness value outside allowable range on Dell Latit=
ude E6410 laptop"</span></span></div><div><br></div><div>Please check it ou=
t at your earliest convenience.</div><div><br></div><div>thanks,</div><div>=
- Gabriel</div></span></body></html>

Hi Gabriel, please avoid sending such html emails to mailing list as it
is hard to read them and also you have a very big chance that email
would be eaten by spam filter or other developers would completely
ignore it...

To debug your problem, can you run smbios-keyboard-ctl tool from the
libsmbios project? https://github.com/dell/libsmbios

We would need output from --info parameter and also from --get-status.

--=20
Pali Roh=C3=A1r
pali.rohar@gmail.com
