From: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RFC v2 6/6] platform/x86: intel_pmc_ipc: Use generic Intel IPC
 device calls
Date: Tue, 5 Sep 2017 08:38:49 +0100
Message-ID: <20170905073849.eeeo3kbncozzer46@dell>
References: <1504401889-113524-7-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f177.google.com ([209.85.128.177]:37478 "EHLO
        mail-wr0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751270AbdIEHix (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Sep 2017 03:38:53 -0400
Received: by mail-wr0-f177.google.com with SMTP id n33so6533621wrn.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Sep 2017 00:38:52 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1504401889-113524-7-git-send-email-sathyanarayanan.kuppuswamy@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: sathyanarayanan.kuppuswamy@linux.intel.com
Cc: souvik.k.chakravarty@intel.com, x86@kernel.org, mingo@redhat.com, qipeng.zha@intel.com, hpa@zytor.com, dvhart@infradead.org, tglx@linutronix.de, andy@infradead.org, linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, sathyaosid@gmail.com

On Sat, 02 Sep 2017, sathyanarayanan.kuppuswamy@linux.intel.com wrote:

> From: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> 
> Removed redundant IPC helper functions and refactored the driver to use
> generic IPC device driver APIs.
> 
> This patch also cleans-up PMC IPC user drivers to use APIs provided
> by generic IPC driver.
> 
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h          |  37 +--

>  drivers/mfd/intel_soc_pmic_bxtwc.c            |  24 +-
>  include/linux/mfd/intel_soc_pmic.h            |   2 +

I'm a bit concerned by the API.  Any reason why you're not using
pointers for addresses?  And for the arguments where you are using
pointers, you should be using NULL, instead of 0.

>  drivers/platform/x86/intel_pmc_ipc.c          | 364 +++++++++-----------------
>  drivers/platform/x86/intel_telemetry_pltdrv.c | 114 ++++----
>  5 files changed, 215 insertions(+), 326 deletions(-)
> 
> Changes since v1:
>  * Removed custom APIs.
>  * Cleaned up PMC IPC user drivers to use APIs provided by generic
>    IPC driver.

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
