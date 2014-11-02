From: =?UTF-8?B?w4lyaWMgUGllbA==?= <eric.piel@tremplin-utc.net>
Subject: Re: [PATCH v2] platform: hp_accel: add a i8042 filter to remove HPQ6000
 data from kb bus stream
Date: Sun, 02 Nov 2014 23:19:30 +0100
Message-ID: <5456ADF2.8080400@tremplin-utc.net>
References: <1414688267-29676-1-git-send-email-giedriuswork@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1414688267-29676-1-git-send-email-giedriuswork@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Giedrius Statkevicius <giedriuswork@gmail.com>
Cc: dvhart@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, dmitry.torokhov@gmail.com
List-Id: platform-driver-x86.vger.kernel.org

On 30-10-14 17:57, Giedrius Statkevicius wrote:
> Add a i8042 filter to hp_accel to remove accelerometer's data with ac=
pi
> id HPQ6000 from keyboard bus stream. The codes sent by accelerometer =
are
> e0 25, e0 26, e0 27 and e0 28. The relevant information is already
> passed through /dev/freefall so no need to send these undocumented we=
ird
> signals through the keyboard bus. Also, unclogs `dmesg` because atkbd
> complained about weird scan codes, saves processing power and disk
> space.
>
> Signed-off-by: Giedrius Statkevi=C4=8Dius <giedriuswork@gmail.com>
> Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Hi,
Looks fine with respect to the hp accel driver. If Dmitry thinks the=20
behaviour is fine then I've got nothing more to say :-)

Reviewed-by: =C3=89ric Piel <eric.piel@tremplin-utc.net>

Darren, could you pick up this patch in your tree?

Cheers,
=C3=89ric


> ---
> Changes in v2:
> * Remove a unnecessary deletion of a blank line
> * Move #includes of i8042.h and serio.h before the relative path
>    includes.
>
> First of all, any Tested-Bys are very welcome by people who also have=
 a
> accelerometer with acpi id HPQ6000. If it happens with HPQ6007 too we
> can easily modify this to install the filter when HPQ6007 is detected=
=2E
> For the time being the filter is only installed when HPQ6000 is
> detected.
>
> Now moving to what was changed since the RFC. I reworked the filter
> function to hopefully make it more clear what it is doing. Since the
> codes sent by the accelerometer are extended then we need to filter a=
ll
> of 0xe0's and then send one 0xe0 back when the actual key isn't in th=
e
> range of 0x25-0x28. Also, I've removed the check for errors for
> i8042_install_filter() because it's unnecessary to check if it failed=
=2E
> If multiple HPQ6000's are in the system then no issue occurs even if
> multiple i8042_install_filter() are issued because this is handled by
> i8042 and it's smart enough not to install the same filter two or mor=
e
> times.
>
> This fixes https://bugzilla.kernel.org/show_bug.cgi?id=3D84941.
:
