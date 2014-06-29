From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v2] Documentation: Rename hpfall.c => freefall.c, fixes
 for Dell
Date: Sat, 28 Jun 2014 19:12:17 -0700
Message-ID: <53AF7601.5000205@infradead.org>
References: <1399114077-19314-3-git-send-email-pali.rohar@gmail.com> <1402473727-5464-1-git-send-email-pali.rohar@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1402473727-5464-1-git-send-email-pali.rohar@gmail.com>
Sender: linux-doc-owner@vger.kernel.org
To: =?UTF-8?B?UGFsaSBSb2jDoXI=?= <pali.rohar@gmail.com>, Matthew Garrett <matthew.garrett@nebula.com>, Pavel Machek <pavel@ucw.cz>, Valdis Kletnieks <valdis.kletnieks@vt.edu>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, Sonal Santan <sonal.santan@gmail.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi,

This should really be done as 2 separate patches:
One to move/rename the file and one to make the changes/additions
to it for DELL.

Can you resend it as 2 patches like that, please?

Thanks... and sorry for the delay.


On 06/11/14 01:02, Pali Roh=C3=A1r wrote:
> Dell kernel driver dell-smo8800 provides same freefall interface as h=
p_accel so
> program hpfall.c works also on Dell laptops. So rename it to freefall=
=2Ec.
>=20
> Dell driver does not provide hp::hddprotect led so make sure that fre=
efall.c
> works also if hp::hddprotect does not exist in sysfs.
>=20
> Additionally write info to syslog.
>=20
> Signed-off-by: Pali Roh=C3=A1r <pali.rohar@gmail.com>
> Cc: Sonal Santan <sonal.santan@gmail.com>
> ---
> Changes since v1:
> * Fixed warnings: Missing a blank line after declarations
> ---
>  Documentation/laptops/00-INDEX   |    4 +-
>  Documentation/laptops/freefall.c |  177 ++++++++++++++++++++++++++++=
++++++++++
>  Documentation/laptops/hpfall.c   |  146 ----------------------------=
---
>  3 files changed, 179 insertions(+), 148 deletions(-)
>  create mode 100644 Documentation/laptops/freefall.c
>  delete mode 100644 Documentation/laptops/hpfall.c


--=20
~Randy
