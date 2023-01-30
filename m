Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69188C54EED
	for <platform-driver-x86@archiver.kernel.org>; Mon, 30 Jan 2023 13:08:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbjA3NIC (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 30 Jan 2023 08:08:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235441AbjA3NIB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 30 Jan 2023 08:08:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3E31724
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:07:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1675084036;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=XhuuL4VJtt9u4xrt/8UaIaAI26VYNj4ZGP0qPBQSDMo=;
        b=WHInsLg2GMRFkM6PHHQvPfOb9YtBqC2NH7HocIfzinthylMbPuqktHOu8L9LOiE2KRwrjy
        oT+LigV2wviG/h+QQRfOcTqpBqlBOmj6p7IUhvTnKa2//AjxhxZlSvPxfOYvXCfg/2rw7s
        lEqE6r46yPLQTkN1mbVaEVuLQNBF78I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-575-Q5AzHCE1O92NOgmACXsI-g-1; Mon, 30 Jan 2023 08:07:14 -0500
X-MC-Unique: Q5AzHCE1O92NOgmACXsI-g-1
Received: by mail-ed1-f72.google.com with SMTP id z6-20020aa7cf86000000b0049f95687b88so8163946edx.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 30 Jan 2023 05:07:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XhuuL4VJtt9u4xrt/8UaIaAI26VYNj4ZGP0qPBQSDMo=;
        b=nupVfbTOfqI8sqy7mY0WzNltifEPH60RaBSUAoO8HLIOma9SyOB+bzpwg6kkLOZ7mF
         RuNYTM/z9SfSLto+Q9XCxmI/2IPkYyJypAcjbsnXNVEGqkNDYm44nW0bRE1LjkETQQYt
         89MzijEmEeUAaphewzboKINWkEy4RhIpQTZDHKH8q9d+7k/P/oFW8tEHRnYwFmzt2c8B
         UGCSS0Pt1ANKFwNQSHEimtc7Ryff8X7OFgn/sc6mW7ey3oryn5Angz0uSX6xjcgoYhHh
         s9MeoBU5BjCFa858a4/3VXTaa68qMwPyJIEh65N8NdJpl8uvbjFGCer78yi0DsivcL81
         rqDA==
X-Gm-Message-State: AFqh2kr9xScNDZr2TGOGczSD9iMQbrEFqSz9opZHfwXUr30e3KmEz6p1
        5R/ngUW2olQ2yJWPD/9TKCGDcNWjAf0YKPiXFcmiR5LPbcqCECmAoPGeuErL/tJcYfq0hHFoDZM
        eXiDKHkeHKtp2hp4aLFwW9Y+LZeE9eE8mCQ==
X-Received: by 2002:a05:6402:4cd:b0:46c:8544:42be with SMTP id n13-20020a05640204cd00b0046c854442bemr50458811edw.5.1675084032634;
        Mon, 30 Jan 2023 05:07:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXumSvWj/TeMun8vPGBGZbjbXwpW5FL5AdECHv5wlI57T3t7cBf+ik9Ms0CmInU+iH6TJ6uC7Q==
X-Received: by 2002:a05:6402:4cd:b0:46c:8544:42be with SMTP id n13-20020a05640204cd00b0046c854442bemr50458806edw.5.1675084032453;
        Mon, 30 Jan 2023 05:07:12 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id v24-20020a056402185800b004a258718d72sm558461edy.63.2023.01.30.05.07.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 05:07:11 -0800 (PST)
Message-ID: <25af7aed-514c-e18c-1223-d4fc28517011@redhat.com>
Date:   Mon, 30 Jan 2023 14:07:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v2] platform/x86/intel/pmc: core: Add support to show
 LTR-ignored components
Content-Language: en-US
To:     Rajat Khandelwal <rajat.khandelwal@intel.com>,
        irenic.rajneesh@gmail.com, david.e.box@intel.com,
        markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
References: <20230125124301.1366990-1-rajat.khandelwal@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230125124301.1366990-1-rajat.khandelwal@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/25/23 13:43, Rajat Khandelwal wrote:
> From: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> 
> Currently, 'ltr_ignore' sysfs attribute, when read, returns nothing, even
> if there are components whose LTR values have been ignored.
> 
> This patch adds the feature to print out such components, if they exist.
> 
> Signed-off-by: Rajat Khandelwal <rajat.khandelwal@linux.intel.com>
> ---
> 
> v2: kmalloc -> devm_kmalloc
> 
>  drivers/platform/x86/intel/pmc/core.c | 47 ++++++++++++++++++++-------
>  drivers/platform/x86/intel/pmc/core.h |  2 +-
>  2 files changed, 36 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/pmc/core.c b/drivers/platform/x86/intel/pmc/core.c
> index 3a15d32d7644..d4196b10b8af 100644
> --- a/drivers/platform/x86/intel/pmc/core.c
> +++ b/drivers/platform/x86/intel/pmc/core.c
> @@ -53,6 +53,14 @@ const struct pmc_bit_map msr_map[] = {
>  	{}
>  };
>  
> +struct ltr_entry {
> +	u32 comp_index;
> +	const char *comp_name;
> +	struct list_head node;
> +};
> +
> +static LIST_HEAD(ltr_ignore_list);

You need to add a static mutex here to protect this list and then take
that mutex in places where you modify or read the list.

Regards,

Hans



> +
>  static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int reg_offset)
>  {
>  	return readl(pmcdev->regbase + reg_offset);
> @@ -435,27 +443,18 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>  
> -int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
> +void pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
>  {
>  	const struct pmc_reg_map *map = pmcdev->map;
>  	u32 reg;
> -	int err = 0;
>  
>  	mutex_lock(&pmcdev->lock);
>  
> -	if (value > map->ltr_ignore_max) {
> -		err = -EINVAL;
> -		goto out_unlock;
> -	}
> -
>  	reg = pmc_core_reg_read(pmcdev, map->ltr_ignore_offset);
>  	reg |= BIT(value);
>  	pmc_core_reg_write(pmcdev, map->ltr_ignore_offset, reg);
>  
> -out_unlock:
>  	mutex_unlock(&pmcdev->lock);
> -
> -	return err;
>  }
>  
>  static ssize_t pmc_core_ltr_ignore_write(struct file *file,
> @@ -464,6 +463,8 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>  {
>  	struct seq_file *s = file->private_data;
>  	struct pmc_dev *pmcdev = s->private;
> +	const struct pmc_reg_map *map = pmcdev->map;
> +	struct ltr_entry *entry;
>  	u32 buf_size, value;
>  	int err;
>  
> @@ -473,13 +474,35 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>  	if (err)
>  		return err;
>  
> -	err = pmc_core_send_ltr_ignore(pmcdev, value);
> +	if (value > map->ltr_ignore_max)
> +		return -EINVAL;
>  
> -	return err == 0 ? count : err;
> +	list_for_each_entry(entry, &ltr_ignore_list, node) {
> +		if (entry->comp_index == value)
> +			return -EEXIST;
> +	}
> +
> +	entry = devm_kmalloc(&pmcdev->pdev->dev, sizeof(*entry), GFP_KERNEL);
> +	if (!entry)
> +		return -ENOMEM;
> +
> +	entry->comp_name = map->ltr_show_sts[value].name;
> +	entry->comp_index = value;
> +	list_add_tail(&entry->node, &ltr_ignore_list);
> +
> +	pmc_core_send_ltr_ignore(pmcdev, value);
> +
> +	return count;
>  }
>  
>  static int pmc_core_ltr_ignore_show(struct seq_file *s, void *unused)
>  {
> +	struct ltr_entry *entry;
> +
> +	list_for_each_entry(entry, &ltr_ignore_list, node) {
> +		seq_printf(s, "%s\n", entry->comp_name);
> +	}
> +
>  	return 0;
>  }
>  
> diff --git a/drivers/platform/x86/intel/pmc/core.h b/drivers/platform/x86/intel/pmc/core.h
> index 810204d758ab..da35b0fcbe6e 100644
> --- a/drivers/platform/x86/intel/pmc/core.h
> +++ b/drivers/platform/x86/intel/pmc/core.h
> @@ -396,7 +396,7 @@ extern const struct pmc_reg_map adl_reg_map;
>  extern const struct pmc_reg_map mtl_reg_map;
>  
>  extern void pmc_core_get_tgl_lpm_reqs(struct platform_device *pdev);
> -extern int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value);
> +extern void pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value);
>  
>  void spt_core_init(struct pmc_dev *pmcdev);
>  void cnp_core_init(struct pmc_dev *pmcdev);

