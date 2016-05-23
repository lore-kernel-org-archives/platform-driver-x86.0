From: Andy Lutomirski <luto@amacapital.net>
Subject: Re: [PATCH 4/4] dell-wmi: Rework code for generating sparse keymap
 and processing WMI events
Date: Mon, 23 May 2016 10:07:59 -0700
Message-ID: <CALCETrWO3wc05uKkgU9W0N9PUE9kOf2tQNN2K9AHTaWgtWu3fg@mail.gmail.com>
References: <1463916983-12562-1-git-send-email-pali.rohar@gmail.com> <1463916983-12562-5-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1463916983-12562-5-git-send-email-pali.rohar@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali.rohar@gmail.com>
Cc: Matthew Garrett <mjg59@srcf.ucam.org>, Darren Hart <dvhart@infradead.org>, Gabriele Mazzotta <gabriele.mzt@gmail.com>, =?UTF-8?B?TWljaGHFgiBLxJlwaWXFhA==?= <kernel@kempniu.pl>, Mario Limonciello <mario_limonciello@dell.com>, Andy Lutomirski <luto@kernel.org>, Alex Hung <alex.hung@canonical.com>, platform-driver-x86@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

On Sun, May 22, 2016 at 4:36 AM, Pali Roh=C3=A1r <pali.rohar@gmail.com>=
 wrote:
> This patch unify procedure for generating sparse keymap and unify als=
o big
> switch code for processing WMI events of different types. After this =
patch
> dell-wmi driver does not differ between "old" and "new" hotkey type.
>
> It construct sparse keymap table with all WMI codes. It is because on=
 some
> laptops (e.g. Dell Latitude E6440) ACPI/firmware send both event type=
s (old
> and new).
>
> Each WMI code in sparse keymap table is prefixed by 16bit event type,=
 so it
> does not change functionality on laptops with "old" hotkey support (t=
hose
> without scancodes in DMI).

This seems like a nice cleanup.  I'll try to test it soon.

--Andy
