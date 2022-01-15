Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CAFC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat, 15 Jan 2022 00:05:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiAOAFh (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Fri, 14 Jan 2022 19:05:37 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:44088 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiAOAFh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jan 2022 19:05:37 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2D020B82A43
        for <platform-driver-x86@vger.kernel.org>; Sat, 15 Jan 2022 00:05:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5D42C36AE9;
        Sat, 15 Jan 2022 00:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642205134;
        bh=An1slhAruAVplvLVhxcW3sJqfFolzxrxpoEUeWAy4Ro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=N1+277DVy25eSzm2BSqpfUnOwOoI7MNqLiL+o+LaL5kGaLbuZV+YerzJ+4F4/qXlQ
         C+TGKzocVBMCoFzDurO37vVWeQUuImGssiOMz6gqnAX8WZfIeBF3yn/yDqV7kD6m79
         dTDdZNToiV8lGSTh9hZNNJvMRljIwCIXBPS8KOVoebheUH5SWQu2h5l5LbQpJnlA8Z
         e3FyOb5YpSdNMbuu4ebzcsvLr2wiqTHGtmwiy6M7BRetwP02wCe7Kk0oWamQh4aPDH
         NlTFadyM6kZNrMosPcflt7wQOsRGLjx0y4B472it0ZR0RMgv7w4NUJ+GorTGnhKviI
         SkB7vbNS3Ak1A==
Date:   Fri, 14 Jan 2022 16:05:33 -0800
From:   Mark Gross <markgross@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: intel_crystal_cove_charger: Fix IRQ
 masking / unmasking
Message-ID: <20220115000533.GB133328@T470>
References: <20220111232309.377642-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220111232309.377642-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 12, 2022 at 12:23:09AM +0100, Hans de Goede wrote:
> The driver as originally submitted accidentally relied on Android having
> run before and Android having unmasked the 2nd level IRQ-mask for the
> charger IRQ. This worked since these are PMIC registers which are only
> reset when the battery is fully drained or disconnected.
Correct me if I'm wrong but Android is a usermode stack.  It cannot unmask
IRQ's form user mode.

I'm guessing the persistant PMIC registeres where set when running a vendor
kernel that was in use with Anroid prior to installing one using this change
and a modern kernel, and after the batteries ran out or where removed the
charger didn't work.

--mark

> 
> Fix the charger IRQ no longer working after loss of battery power by
> properly setting the 2nd level IRQ-mask for the charger IRQ.
> 
> Note this removes the need to enable/disable our parent IRQ which just
> sets the mask bit in the 1st level IRQ-mask register, setting one of
> the 2 level masks is enough to stop the IRQ from getting reported.
> 
> Fixes: 761db353d9e2 ("platform/x86: Add intel_crystal_cove_charger driver")
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  .../platform/x86/intel/crystal_cove_charger.c | 26 +++++++++----------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/crystal_cove_charger.c b/drivers/platform/x86/intel/crystal_cove_charger.c
> index 0374bc742513..eeaa926d2058 100644
> --- a/drivers/platform/x86/intel/crystal_cove_charger.c
> +++ b/drivers/platform/x86/intel/crystal_cove_charger.c
> @@ -17,6 +17,7 @@
>  #include <linux/regmap.h>
>  
>  #define CHGRIRQ_REG					0x0a
> +#define MCHGRIRQ_REG					0x17
>  
>  struct crystal_cove_charger_data {
>  	struct mutex buslock; /* irq_bus_lock */
> @@ -25,8 +26,8 @@ struct crystal_cove_charger_data {
>  	struct irq_domain *irq_domain;
>  	int irq;
>  	int charger_irq;
> -	bool irq_enabled;
> -	bool irq_is_enabled;
> +	u8 mask;
> +	u8 new_mask;
>  };
>  
>  static irqreturn_t crystal_cove_charger_irq(int irq, void *data)
> @@ -53,13 +54,9 @@ static void crystal_cove_charger_irq_bus_sync_unlock(struct irq_data *data)
>  {
>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>  
> -	if (charger->irq_is_enabled != charger->irq_enabled) {
> -		if (charger->irq_enabled)
> -			enable_irq(charger->irq);
> -		else
> -			disable_irq(charger->irq);
> -
> -		charger->irq_is_enabled = charger->irq_enabled;
> +	if (charger->mask != charger->new_mask) {
> +		regmap_write(charger->regmap, MCHGRIRQ_REG, charger->new_mask);
> +		charger->mask = charger->new_mask;
>  	}
>  
>  	mutex_unlock(&charger->buslock);
> @@ -69,14 +66,14 @@ static void crystal_cove_charger_irq_unmask(struct irq_data *data)
>  {
>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>  
> -	charger->irq_enabled = true;
> +	charger->new_mask &= ~BIT(data->hwirq);
>  }
>  
>  static void crystal_cove_charger_irq_mask(struct irq_data *data)
>  {
>  	struct crystal_cove_charger_data *charger = irq_data_get_irq_chip_data(data);
>  
> -	charger->irq_enabled = false;
> +	charger->new_mask |= BIT(data->hwirq);
>  }
>  
>  static void crystal_cove_charger_rm_irq_domain(void *data)
> @@ -130,10 +127,13 @@ static int crystal_cove_charger_probe(struct platform_device *pdev)
>  	irq_set_nested_thread(charger->charger_irq, true);
>  	irq_set_noprobe(charger->charger_irq);
>  
> +	/* Mask the single 2nd level IRQ before enabling the 1st level IRQ */
> +	charger->mask = BIT(0);
> +	regmap_write(charger->regmap, MCHGRIRQ_REG, charger->mask);
> +
>  	ret = devm_request_threaded_irq(&pdev->dev, charger->irq, NULL,
>  					crystal_cove_charger_irq,
> -					IRQF_ONESHOT | IRQF_NO_AUTOEN,
> -					KBUILD_MODNAME, charger);
> +					IRQF_ONESHOT, KBUILD_MODNAME, charger);
>  	if (ret)
>  		return dev_err_probe(&pdev->dev, ret, "requesting irq\n");
>  
> -- 
> 2.33.1
> 
