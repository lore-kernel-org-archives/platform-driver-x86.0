Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 878FFC678DC
	for <platform-driver-x86@archiver.kernel.org>; Fri, 18 Aug 2023 12:21:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243157AbjHRMVH convert rfc822-to-8bit (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 18 Aug 2023 08:21:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346369AbjHRMUq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 18 Aug 2023 08:20:46 -0400
Received: from irl.hu (irl.hu [95.85.9.111])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26238E7C
        for <platform-driver-x86@vger.kernel.org>; Fri, 18 Aug 2023 05:20:44 -0700 (PDT)
Received: from [192.168.2.4] (51b69a51.dsl.pool.telekom.hu [::ffff:81.182.154.81])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 00000000000730EC.0000000064DF621A.0003B3CE; Fri, 18 Aug 2023 14:20:42 +0200
Message-ID: <00502b11a96309012dab2ec932fe0d6ea1c69e12.camel@irl.hu>
Subject: Re: [PATCH 1/1 V2] Add Lenovo Yoga 7 14ACN6 to
 ec_trigger_quirk_dmi_table
From:   =?UTF-8?Q?Gerg=C5=91_K=C3=B6teles?= <soyer@irl.hu>
To:     Swapnil Devesh <me@sidevesh.com>,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>
Date:   Fri, 18 Aug 2023 14:20:41 +0200
In-Reply-To: <18a065bcf2b.8463a18831891.1434329337528931605@sidevesh.com>
References: <18a065bcf2b.8463a18831891.1434329337528931605@sidevesh.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Swapnil,

Thank you for the patch.

On Fri, 2023-08-18 at 07:26 +0530, Swapnil Devesh wrote:
> This adds my laptop Lenovo Yoga 7 14ACN6, with Product Name: 82N7 (from `dmidecode -t1 | grep "Product Name"`) to the ec_trigger_quirk_dmi_table, have tested that this is required for the YMC driver to work correctly on this model.
> 
> Sending again as V2 from the mail that is signing off on this and the previous push had the tabs removed messing up the formatting of the patch.
> 
> Thanks to Gergo, the author of the Lenovo YMC driver for guiding this.
> 
> Signed-off-by: Swapnil Devesh <me@sidevesh.com>
> ---
>  drivers/platform/x86/lenovo-ymc.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/platform/x86/lenovo-ymc.c b/drivers/platform/x86/lenovo-ymc.c
> index 41676188b373..7d38151a5b27 100644
> --- a/drivers/platform/x86/lenovo-ymc.c
> +++ b/drivers/platform/x86/lenovo-ymc.c
> @@ -32,6 +32,13 @@ static const struct dmi_system_id ec_trigger_quirk_dmi_table[] = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "82QF"),
>  		},
>  	},
> +	{
> +		/* Lenovo Yoga 7 14ACN6 */
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "82N7"),
> +		},
> +	},
>  	{ }
>  };
> 

Could you add "platform/x86: lenovo-ymc:" to the subject?
Otherwise looks good to me:

Reviewed-by: Gergő Köteles <soyer@irl.hu>

Regards,
Gergő

