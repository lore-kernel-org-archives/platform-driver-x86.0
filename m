From: Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH v2] platform/x86/asus-nb-wmi.c: Add X45U quirk
Date: Sat, 5 Nov 2016 11:24:04 -0700
Message-ID: <20161105182404.GB100528@f23x64.localdomain>
References: <1477965370-24892-1-git-send-email-marcos.souza.org@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1477965370-24892-1-git-send-email-marcos.souza.org@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
Cc: corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org

On Mon, Oct 31, 2016 at 11:56:10PM -0200, Marcos Paulo de Souza wrote:
> Without this patch, the Asus X45U wireless card can't be turned
> on (hard-blocked), but after a suspend/resume it just starts working.
> 
> Following this bug report[1], there are other cases like this one, but
> this Asus is the only model that I can test.
> 
> [1] https://ubuntuforums.org/showthread.php?t=2181558
> 
> Signed-off-by: Marcos Paulo de Souza <marcos.souza.org@gmail.com>
> Cc: <stable@vger.kernel.org>
> 
> ---
> This patch applies smoothly in 4.8.6 and 4.4.29. I hope now I followed
> the instructions correctly.

Hi Marcos,

You'll find exact steps in the stable_kernel_rules.txt document regarding how to
annotate the commit message with Cc lines indicating to which versions this
patch should be applied.

If, for example, you have verified that this patch is relevant only to 4.4 and
forward, you would include:

Cc: <stable@vger.kernel.org> # 4.4.x-

But this should mean that the patch is explicitly broken or otherwise
inappropriate for 4.3 and earlier.

Thanks,

-- 
Darren Hart
Intel Open Source Technology Center
