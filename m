From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [RFC v1 1/6] platform/x86: intel_pmc_ipc: Fix error handling in ipc_pci_probe()
Date: Fri, 18 Aug 2017 15:22:36 +0300
Message-ID: <CAHp75VeEmafhdju6Ekq1syqb7ir2Ntov7Ypbby8bFDfKPQ8+pw@mail.gmail.com>
References: <cover.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com> <5d15388eeb82aed7839b6d842c26168a935c915a.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-qk0-f196.google.com ([209.85.220.196]:37874 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750810AbdHRMWi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2017 08:22:38 -0400
In-Reply-To: <5d15388eeb82aed7839b6d842c26168a935c915a.1501610760.git.sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: "x86@kernel.org" <x86@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zha Qipeng <qipeng.zha@intel.com>, "H. Peter Anvin" <hpa@zytor.com>, "dvhart@infradead.org" <dvhart@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andy@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Platform Driver <platform-driver-x86@vger.kernel.org>, Sathyanarayanan Kuppuswamy Natarajan <sathyaosid@gmail.com>

On Tue, Aug 1, 2017 at 9:13 PM,
<sathyanarayanan.kuppuswamy@linux.intel.com> wrote:
> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>
> This patch adds proper error handling for failure cases in
> ipc_pci_probe() function.
>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_ipc.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_ipc.c b/drivers/platform/x86/intel_pmc_ipc.c
> index bb792a5..7b65237 100644
> --- a/drivers/platform/x86/intel_pmc_ipc.c
> +++ b/drivers/platform/x86/intel_pmc_ipc.c
> @@ -489,33 +489,46 @@ static int ipc_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
>
>         ret = pci_enable_device(pdev);
>         if (ret)
> -               return ret;
> +               goto release_device;

Instead of doing this way and ping-ponging code in the same series,
better to switch to managed PCI functions in the first place.

-- 
With Best Regards,
Andy Shevchenko
