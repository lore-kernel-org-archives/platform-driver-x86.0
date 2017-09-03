From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v2 1/6] platform/x86: intel_pmc_ipc: Use devm_* calls in
 driver probe function
Date: Sun, 3 Sep 2017 15:34:09 +0300
Message-ID: <CAHp75VdrPp0D6sq82TR=MA2zwz=LPr6Lpd3DxPtSVaBnM6tsng@mail.gmail.com>
References: <1504401889-113524-2-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:33064 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753082AbdICMeL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 3 Sep 2017 08:34:11 -0400
In-Reply-To: <1504401889-113524-2-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Souvik Kumar Chakravarty <souvik.k.chakravarty@intel.com>, "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Lee Jones <lee.jones@linaro.org>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

On Sun, Sep 3, 2017 at 4:24 AM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> This patch cleans up unnecessary free/alloc calls in ipc_plat_probe(),
> ipc_pci_probe() and ipc_plat_get_res() functions by using devm_*
> calls.
>
> This patch also adds proper error handling for failure cases in
> ipc_pci_probe() function.

>         ret = pci_enable_device(pdev);
>         if (ret)
> -               return ret;
> +               goto release_device;

Instead you should use PCI managed function(s).

-- 
With Best Regards,
Andy Shevchenko
