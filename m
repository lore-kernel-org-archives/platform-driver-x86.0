Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E03AC433EF
	for <platform-driver-x86@archiver.kernel.org>; Sat,  2 Apr 2022 06:05:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234419AbiDBGHA (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 2 Apr 2022 02:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiDBGHA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Apr 2022 02:07:00 -0400
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A3AC117981
        for <platform-driver-x86@vger.kernel.org>; Fri,  1 Apr 2022 23:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
        :In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=+IKSae3yHxZrj+VKCqIUsJLMAnZirliL5CqXqDVFzdU=; b=e7qWTr/c/CBSxEXA/et9RFJydW
        V7DVXbjmp5u+SPSGN0JoNwTOrooPhPYE9kJDSxFl+IZftnAQCHx8Id/5gjYW/3EQgYMHTB/ZZ2aGh
        +hdnS+wu5U1Hdox1LmoOEQF9WSo6SoiUba3lXsecoklkYbZdjS8WZ7/WiTTU4zL5/ASr9OxcToPOu
        JX1PFGShpomVlWkRje6d7oWfsgFn4GcABH+Fk4Ip+I4Gtge+r15eAMvk4uwSbveaI5L6WN8xt8aH2
        N9eVPhzIkQCO1xM1IBoiV3+wbRK7maeCszuNAvfuY2ONr+Dr1yWBAqtnDNkLipRQ52dklppaBBPIB
        w8W5IxIg==;
Received: from [2601:1c0:6280:3f0::aa0b]
        by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1naWsX-000lzF-OJ; Sat, 02 Apr 2022 06:04:57 +0000
Message-ID: <bdb8c8ca-c5b7-4f3b-bd00-422f4e7dd1ec@infradead.org>
Date:   Fri, 1 Apr 2022 23:04:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] platform/x86: amd-pmc: Fix compilation without
 CONFIG_SUSPEND
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        "open list:X86 PLATFORM DRIVERS" 
        <platform-driver-x86@vger.kernel.org>
Cc:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        Goswami Sanket <Sanket.Goswami@amd.com>
References: <20220401155329.3467-1-mario.limonciello@amd.com>
From:   Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20220401155329.3467-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 4/1/22 08:53, Mario Limonciello wrote:
> Since commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the
> suspend process") amd-pmc doesn't use traditional suspend resume
> callback anymore but relies on functions only created declared when
> CONFIG_SUSPEND is set.
> 
> Check for CONFIG_SUSPEND and only use those functions in those
> circumstances.
> 
> Fixes: commit b1f66033cd4e ("platform/x86: amd-pmc: Move to later in the suspend process")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

Yeah, that works except for this part:

../drivers/platform/x86/amd-pmc.c:693:35: error: ‘amd_pmc_s2idle_dev_ops’ defined but not used [-Werror=unused-variable]
 static struct acpi_s2idle_dev_ops amd_pmc_s2idle_dev_ops = {
                                   ^~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors


> ---
>  drivers/platform/x86/amd-pmc.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> index e9d0dbbb2887..b121686407ff 100644
> --- a/drivers/platform/x86/amd-pmc.c
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -859,9 +859,11 @@ static int amd_pmc_probe(struct platform_device *pdev)
>  
>  	amd_pmc_get_smu_version(dev);
>  	platform_set_drvdata(pdev, dev);
> +#ifdef CONFIG_SUSPEND
>  	err = acpi_register_lps0_dev(&amd_pmc_s2idle_dev_ops);
>  	if (err)
>  		dev_warn(dev->dev, "failed to register LPS0 sleep handler, expect increased power consumption\n");
> +#endif
>  
>  	amd_pmc_dbgfs_register(dev);
>  	return 0;
> @@ -875,7 +877,9 @@ static int amd_pmc_remove(struct platform_device *pdev)
>  {
>  	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
>  
> +#ifdef CONFIG_SUSPEND
>  	acpi_unregister_lps0_dev(&amd_pmc_s2idle_dev_ops);
> +#endif
>  	amd_pmc_dbgfs_unregister(dev);
>  	pci_dev_put(dev->rdev);
>  	mutex_destroy(&dev->lock);

thanks.
-- 
~Randy
