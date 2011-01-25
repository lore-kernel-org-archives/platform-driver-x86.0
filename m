From: "Rafael J. Wysocki" <rjw@sisk.pl>
Subject: Re: Common boot/shutdown issues with the latest 2.6.37 (Mostly Asus laptops)
Date: Tue, 25 Jan 2011 20:54:46 +0100
Message-ID: <201101252054.46647.rjw@sisk.pl>
References: <556624.21214.qm@web28409.mail.ukl.yahoo.com> <201101252038.25113.rjw@sisk.pl> <4D3F2869.3000406@pardus.org.tr>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-acpi-owner@vger.kernel.org>
In-Reply-To: <4D3F2869.3000406@pardus.org.tr>
Sender: linux-acpi-owner@vger.kernel.org
To: Ozan =?utf-8?q?=C3=87a=C4=9Flayan?= <ozan@pardus.org.tr>
Cc: Lionel Debroux <lionel_debroux@yahoo.fr>, linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, colin.king@canonical.com
List-Id: platform-driver-x86.vger.kernel.org

On Tuesday, January 25, 2011, Ozan =C3=87a=C4=9Flayan wrote:
> On 25.01.2011 21:38, Rafael J. Wysocki wrote:
>=20
> > Does
> > http://git.kernel.org/?p=3Dlinux/kernel/git/torvalds/linux-2.6.git;=
a=3Dcommit;h=3Dec30f343d61391ab23705e50a525da1d55395780
> > generally help?
>=20
> Well I can let them try a patched kernel but will a kernel showing=20
> acpi_idle as the cpuidle driver in dmesg will be affected by this pat=
ch?
> I can't see any sign on reporters' dmesg that intel_idle is active.

If intel_idle is not active, then the patch will not help.

However, it would be good to check if the affected systems work with
intel_idle + the above patch instead of acpi_idle.

Thanks,
Rafael
--
To unsubscribe from this list: send the line "unsubscribe linux-acpi" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
