From: Ingo Molnar <mingo@elte.hu>
Subject: Re: [GIT PULL] X86 platform drivers updates
Date: Wed, 13 Apr 2011 08:52:32 +0200
Message-ID: <20110413065232.GA26072@elte.hu>
References: <20110412153130.GA32247@srcf.ucam.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mx3.mail.elte.hu ([157.181.1.138]:39280 "EHLO mx3.mail.elte.hu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753320Ab1DMGwr (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Wed, 13 Apr 2011 02:52:47 -0400
Content-Disposition: inline
In-Reply-To: <20110412153130.GA32247@srcf.ucam.org>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Matthew Garrett <mjg59@srcf.ucam.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: torvalds@linux-foundation.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org


* Matthew Garrett <mjg59@srcf.ucam.org> wrote:

>       platform-drivers: x86: pmic: Restore the dropped buslock/unlock

>  drivers/platform/x86/intel_pmic_gpio.c          |   43 +-

This commit (now upstream) does not build at all on allyes64:

  drivers/platform/x86/intel_pmic_gpio.c:212:19: error: =E2=80=98pmic_i=
rq_buslock=E2=80=99 undeclared here

Thanks,

	Ingo
