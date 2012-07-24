From: =?UTF-8?B?TWlndWVsIEfDs21leg==?= <magomez@igalia.com>
Subject: Re: [PATCH] classmate-laptop: Fix extra keys hardware id.
Date: Tue, 24 Jul 2012 15:17:26 +0200
Message-ID: <500EA066.8000601@igalia.com>
References: <20120724030946.GA2742@nautilus.holoscopio.com> <1343135125-18733-1-git-send-email-magomez@igalia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1343135125-18733-1-git-send-email-magomez@igalia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWlndWVsIEfDs21leg==?= <magomez@igalia.com>
Cc: cascardo@holoscopio.com, don@syst.com.br, mjg@redhat.com, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

> Since ACPI devices ids were changed to use always upper-case letters,=
 the ACPI
> id of the extra keys (FNBT0000) was not maching the one defined in th=
e driver
> (FnBT0000), causing the extra keys not to work.
>
> The patch replaces the driver id with the one reported by ACPI, fixin=
g the
> problem.
>
> Signed-off-by: Miguel G=C3=B3mez <magomez@igalia.com>

I've created this patch on top of linux-next, but it won't apply over=20
the patch I've just sent for the accelerometer (neither the later over=20
the former).

How do you want me to proceed? Should I sent this again over the=20
accelerometer patch?

Regards!

--=20
Miguel G=C3=B3mez
Igalia - http://www.igalia.com
