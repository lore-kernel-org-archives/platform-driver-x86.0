From: Shuah Khan <shuah.kh@samsung.com>
Subject: Re: [tpmdd-devel] [PATCH 3/4] tpm: Convert tpm_tis driver to use
 dev_pm_ops from legacy pm_ops
Date: Thu, 11 Jul 2013 01:30:43 +0000
Message-ID: <B8EFE96D1287C24090BAD9D858E15E61738C1B@sisaex02sj>
References: <1373429409-3944-1-git-send-email-shuah.kh@samsung.com>
 <201307110051.04726.PeterHuewe@gmx.de>
 <B8EFE96D1287C24090BAD9D858E15E61738933@sisaex02sj>
 <201307110137.32309.PeterHuewe@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?iso-8859-1?Q?Peter_H=FCwe?= <PeterHuewe@gmx.de>
Cc: "tpmdd-devel@lists.sourceforge.net" <tpmdd-devel@lists.sourceforge.net>, "rafael.j.wysocki@intel.com" <rafael.j.wysocki@intel.com>, "bhelgaas@google.com" <bhelgaas@google.com>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "key@linux.vnet.ibm.com" <key@linux.vnet.ibm.com>, "mail@srajiv.net" <mail@srajiv.net>, "tpmdd@selhorst.net" <tpmdd@selhorst.net>, "tpmdd@sirrix.com" <tpmdd@sirrix.com>, "matthew.garrett@nebula.com" <matthew.garrett@nebula.com>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "shuahkhan@gmail.com" <shuahkhan@gmail.com>, "Rafael J. Wysocki" <rjw@sisk.pl>, Shuah Khan <shuah.kh@samsung.com>
List-Id: platform-driver-x86.vger.kernel.org

Hi Peter,

On 07/10/2013 05:30 PM, Peter H=FCwe wrote:

>>
>> tpm_tis_resume() is defined originally in CONFIG_PM_SLEEP scope. I c=
an
>> make the change to have tpm_tis_resume() not be in CONFIG_PM_SLEEP s=
cope
>> and remove this CONFIG_PM_SLEEP when defining .pm.
>> That does make sense looking at tpm_pm_suspend() and tpm_pm_resume()=
 which
>> are defined ithout CONFIG_PM_SLEEP scope. Sounds like the right appr=
oach?
>> I will redo the patch and send v2.
>
> Hmm,
> at first I thought that would be a good idea, however scrolling to th=
e git
> history I found:
>
> commit 07368d32f1a67e797def08cf2ee3ea1647b204b6
> Author: Rafael J. Wysocki <rjw@sisk.pl>
> Date:   Thu Aug 9 23:00:35 2012 +0200
>
>      tpm_tis / PM: Fix unused function warning for CONFIG_PM_SLEEP
>
>      According to a compiler warning, the tpm_tis_resume() function i=
s not
>      used for CONFIG_PM_SLEEP unset, so add a #ifdef to prevent it fr=
om
>      being built in that case.
>
>      Signed-off-by: Rafael J. Wysocki <rjw@sisk.pl>
>
> So removing it there would effectively revert the patch and re-enable=
 the
> warning.
>
>
>
>> I find that the use of CONFIG_PM, CONFIG_PM_SLEEP, and CONFIG_PM_RUN=
TIME
>> are not very consistent. :)
> Yes.
>
> Maybe the better idea is to add the correct CONFIG_PM ifdefs for all =
code
> paths related to PM.
> Or leave the CONFIG_PM for tpm_tis_resume as it is.
>
>

=46or now, leaving tpm_tis_resume() is better to keep this change simpl=
er.=20
I am seeing this type of inconsistency in several drivers as I am going=
=20
around making changes to convert from legacy pm_ops to dev_pm_ops. At=20
some point, it might be worth while looking at the usage of these=20
defines and set some clear guidelines.

-- Shuah

Shuah Khan, Linux Kernel Developer - Open Source Group Samsung Research=
=20
America (Silicon Valley) shuah.kh@samsung.com | (970) 672-0658
