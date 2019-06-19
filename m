From: "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Subject: RE: [PATCH v2] x86/efi: fix a -Wtype-limits compilation warning
Date: Wed, 19 Jun 2019 17:53:37 +0000
Message-ID: <FFF73D592F13FD46B8700F0A279B802F4F787D4B@ORSMSX114.amr.corp.intel.com>
References: <1560966464-27644-1-git-send-email-cai@lca.pw>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560966464-27644-1-git-send-email-cai@lca.pw>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Qian Cai <cai@lca.pw>, "bp@alien8.de" <bp@alien8.de>
Cc: "ard.biesheuvel@linaro.org" <ard.biesheuvel@linaro.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "dvhart@infradead.org" <dvhart@infradead.org>, "andy@infradead.org" <andy@infradead.org>, "tglx@linutronix.de" <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>, "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>, "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>, "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: platform-driver-x86.vger.kernel.org

> Compiling a kernel with W=1 generates this warning,
> 
> arch/x86/platform/efi/quirks.c:731:16: warning: comparison of unsigned
> expression >= 0 is always true [-Wtype-limits]
> 
> Fixes: 3425d934fc03 ("efi/x86: Handle page faults occurring while running EFI
> runtime services")
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
> 
> v2: Add a "Fixes" tag.

Makes sense.
Thanks for the fix Qian Cai.

Regards,
Sai
