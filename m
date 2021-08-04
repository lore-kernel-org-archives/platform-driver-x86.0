Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC411C4338F
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 10:49:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5DFF60EE5
	for <platform-driver-x86@archiver.kernel.org>; Wed,  4 Aug 2021 10:49:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237610AbhHDKti (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 4 Aug 2021 06:49:38 -0400
Received: from mail.ispras.ru ([83.149.199.84]:56590 "EHLO mail.ispras.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236736AbhHDKtI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Aug 2021 06:49:08 -0400
Received: from hellwig.intra.ispras.ru (unknown [10.10.2.182])
        by mail.ispras.ru (Postfix) with ESMTPSA id 21450405A19B;
        Wed,  4 Aug 2021 10:48:54 +0000 (UTC)
Subject: Re: [PATCH] platform/x86: intel_pmc_core: Prevent possibile overflow
To:     "David E. Box" <david.e.box@linux.intel.com>,
        irenic.rajneesh@gmail.com, gayatri.kammela@intel.com,
        hdegoede@redhat.com, mgross@linux.intel.com,
        andy.shevchenko@gmail.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <facd47b64a5efa4e0e70cd29586173e44a8929c2.camel@linux.intel.com>
 <20210804003039.359138-1-david.e.box@linux.intel.com>
From:   Evgeny Novikov <novikov@ispras.ru>
Message-ID: <159dec07-9f05-3a92-8b7d-3d2f27448f70@ispras.ru>
Date:   Wed, 4 Aug 2021 13:48:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210804003039.359138-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

Your patch fixes the out of bound issue, but I have another concern 
regarding possible incomplete initialization of first 8 elements of the 
lpm_priority array that is declared on the stack and is not initialized, 
say, with zeroes. Yet again due to some invalid values coming from the 
register, it is not guaranteed that something meaningful will be 
assigned for all first 8 elements of lpm_priority in the first cycle in 
pmc_core_get_low_power_modes(). In the second cycle this function 
accesses all these elements from lpm_priority. Though there is test 
"!(BIT(mode) & lpm_en)", it can pass accidentally, thus some unexpected 
values can be stored to "pmcdev->lpm_en_modes[i++]" and exposed later.


Best regards,
Evgeny Novikov


On 04.08.2021 03:30, David E. Box wrote:
> Low Power Mode (LPM) priority is encoded in 4 bits. Yet, this value is used
> as an index to an array whose element size was less than 16, leading to the
> possibility of overflow should we read a larger than expected priority. Set
> the array size to 16 to prevent this.
>
> Reported-by: Evgeny Novikov <novikov@ispras.ru>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>   drivers/platform/x86/intel_pmc_core.c | 2 +-
>   drivers/platform/x86/intel_pmc_core.h | 1 +
>   2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index b0e486a6bdfb..2a761fe98277 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -1451,7 +1451,7 @@ DEFINE_SHOW_ATTRIBUTE(pmc_core_pkgc);
>   
>   static void pmc_core_get_low_power_modes(struct pmc_dev *pmcdev)
>   {
> -	u8 lpm_priority[LPM_MAX_NUM_MODES];
> +	u8 lpm_priority[LPM_MAX_PRI];
>   	u32 lpm_en;
>   	int mode, i, p;
>   
> diff --git a/drivers/platform/x86/intel_pmc_core.h b/drivers/platform/x86/intel_pmc_core.h
> index e8dae9c6c45f..b98c2b44c938 100644
> --- a/drivers/platform/x86/intel_pmc_core.h
> +++ b/drivers/platform/x86/intel_pmc_core.h
> @@ -190,6 +190,7 @@ enum ppfear_regs {
>   #define LPM_MAX_NUM_MODES			8
>   #define GET_X2_COUNTER(v)			((v) >> 1)
>   #define LPM_STS_LATCH_MODE			BIT(31)
> +#define LPM_MAX_PRI				16	/* size of 4 bits */
>   
>   #define TGL_PMC_SLP_S0_RES_COUNTER_STEP		0x7A
>   #define TGL_PMC_LTR_THC0			0x1C04
