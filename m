From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: Re: [PATCH] hp_accel: Add a new PnP ID HPQ6007 for new HP laptops
Date: Sat, 09 Mar 2013 12:59:59 +0100
Message-ID: <513B243F.8020706@tremplin-utc.net>
References: <s5h4ngz56yg.wl%tiwai@suse.de> <5135DBD5.1070702@tremplin-utc.net> <1362498177.7780.13.camel@x230> <s5hk3plu9yc.wl%tiwai@suse.de> <CAKocOOMNgGxwoqxKCrvO_46vLALdjaDMHLeRyFZZ2veNgyJO2g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <stable-owner@vger.kernel.org>
In-Reply-To: <CAKocOOMNgGxwoqxKCrvO_46vLALdjaDMHLeRyFZZ2veNgyJO2g@mail.gmail.com>
Sender: stable-owner@vger.kernel.org
To: Shuah Khan <shuahkhan@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>, Matthew Garrett <matthew.garrett@nebula.com>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, stable <stable@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>
List-Id: platform-driver-x86.vger.kernel.org

On 08-03-13 23:59, Shuah Khan wrote:
:
> Should this be tagged for stables releases? This patch went into suse
> git and just checking to see if it should go into stable releases.
Hello,
This patch will make the module automatically load on some new HP=20
laptops. So although it's not fixing a bug, it will extend hardware=20
support (a very little bit), which can be considered material for stabl=
e=20
trees, indeed.

Cheers,
=C3=89ric
