Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBBA4C4332F
	for <platform-driver-x86@archiver.kernel.org>; Tue, 22 Feb 2022 14:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbiBVOp0 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 22 Feb 2022 09:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232847AbiBVOpZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Feb 2022 09:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 98E8B65427
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 06:44:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645541098;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Pi2rjzwWJCsz1l1I4uoWGPB26BchWaIZD/weN4Zfg3Y=;
        b=GdUoonqkREq61kbMAs/2T2ACo8kxCyz+kSIia6KNvjosqlgWMTF5pYMgaoOIYf/Bpl4sI5
        DWJQnFGyWoaq8sfg5XEULU5ZjN7zJO3MjX0zkHUv0nEYBqE5MS6JwZS0X5BtReg0evEO3i
        fNx7J1LhV7GgrLGqrB+nYz9z3xY69C4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-P_bbwhb4Nv-72hihdJOI1Q-1; Tue, 22 Feb 2022 09:44:57 -0500
X-MC-Unique: P_bbwhb4Nv-72hihdJOI1Q-1
Received: by mail-ed1-f70.google.com with SMTP id e10-20020a056402190a00b00410f20467abso12063340edz.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Feb 2022 06:44:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Pi2rjzwWJCsz1l1I4uoWGPB26BchWaIZD/weN4Zfg3Y=;
        b=lh6jM6wWAVWjcmt11e72hf+/JoVdevd+9vFYG61l0tPiFI5SIrAmKI382OUA1O5890
         LTZGSe3K0bpimaS2Tgfw6ke2kvnt0yud7yaJntgJzySYVNBswlxRbjHOLregY0EYn1BM
         oe0VkcqalAx9vqXwIE32+0hEj+JSetzp4TLG9eUL0hquxTxnuVRMYnVojc9MgQn3By+U
         2VlwIFCLF24ZAE5bvuX3Ztm31ECkXkfJTnT/ZQjAbwG8q7w5SodKkmO577gYTaSCM8VX
         2rfLbBHxlDr+coPVBemPjZD7SOSBnOVciYJKQPGjGDSy7KC+nKXOo7nxw4jrXUElIwXz
         1XTQ==
X-Gm-Message-State: AOAM5302pfNb3IVZfFyjryQYDGawCLKYTJGh9aCXeNx0p3s64roYZnQZ
        DMLX9Ue7rtwg96Rg4Iayz8xxsk7dtdYFPjK8sYB3Y52zw2SxKVQq//+i962ikVG1iurWczgwNAo
        LwMP/w3/ZAuLKJzTs1i4rB1kUsO0/0Wp9Vg==
X-Received: by 2002:a05:6402:350d:b0:410:b608:ff4f with SMTP id b13-20020a056402350d00b00410b608ff4fmr26942053edd.89.1645541096297;
        Tue, 22 Feb 2022 06:44:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvM5S5RkK76j3FGBHN8kvT6AFU1ejMN2c3FmagD8AC6C6lx/6xeCsefO8fOLWZtXqr9Vy3Bw==
X-Received: by 2002:a05:6402:350d:b0:410:b608:ff4f with SMTP id b13-20020a056402350d00b00410b608ff4fmr26942029edd.89.1645541096041;
        Tue, 22 Feb 2022 06:44:56 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id h19sm10458362edt.6.2022.02.22.06.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Feb 2022 06:44:55 -0800 (PST)
Message-ID: <0bcc6093-4e38-3a0d-e619-3575bfeed410@redhat.com>
Date:   Tue, 22 Feb 2022 15:44:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 3/6] platform/x86: int3472: Support multiple clock
 consumers
Content-Language: en-US
To:     kernel test robot <lkp@intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        linux-acpi@vger.kernel.org, linux-clk@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Cc:     kbuild-all@lists.01.org, rafael@kernel.org, lenb@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, markgross@kernel.org,
        robert.moore@intel.com
References: <20220216225304.53911-4-djrscally@gmail.com>
 <202202171110.7EOaTUJH-lkp@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <202202171110.7EOaTUJH-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/17/22 04:22, kernel test robot wrote:
> Hi Daniel,
> 
> I love your patch! Perhaps something to improve:
> 
> [auto build test WARNING on rafael-pm/linux-next]
> [also build test WARNING on clk/clk-next linus/master v5.17-rc4 next-20220216]
> [cannot apply to platform-drivers-x86/for-next]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Daniel-Scally/Add-multiple-consumer-support-to-int3472-tps68470-driver/20220217-065452
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
> config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20220217/202202171110.7EOaTUJH-lkp@intel.com/config)
> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> smatch warnings:
> drivers/platform/x86/intel/int3472/tps68470.c:155 skl_int3472_tps68470_probe() warn: unsigned 'n_consumers' is never less than zero.

Right this needs to be an int, not an unsigned int. Daniel, please fix this for v2.

Regards,

Hans



> 
> vim +/n_consumers +155 drivers/platform/x86/intel/int3472/tps68470.c
> 
>    142	
>    143	static int skl_int3472_tps68470_probe(struct i2c_client *client)
>    144	{
>    145		struct acpi_device *adev = ACPI_COMPANION(&client->dev);
>    146		const struct int3472_tps68470_board_data *board_data;
>    147		struct tps68470_clk_platform_data *clk_pdata;
>    148		unsigned int n_consumers;
>    149		struct mfd_cell *cells;
>    150		struct regmap *regmap;
>    151		int device_type;
>    152		int ret;
>    153	
>    154		n_consumers = skl_int3472_fill_clk_pdata(&client->dev, &clk_pdata);
>  > 155		if (n_consumers < 0)
>    156			return n_consumers;
>    157	
>    158		regmap = devm_regmap_init_i2c(client, &tps68470_regmap_config);
>    159		if (IS_ERR(regmap)) {
>    160			dev_err(&client->dev, "Failed to create regmap: %ld\n", PTR_ERR(regmap));
>    161			return PTR_ERR(regmap);
>    162		}
>    163	
>    164		i2c_set_clientdata(client, regmap);
>    165	
>    166		ret = tps68470_chip_init(&client->dev, regmap);
>    167		if (ret < 0) {
>    168			dev_err(&client->dev, "TPS68470 init error %d\n", ret);
>    169			return ret;
>    170		}
>    171	
>    172		device_type = skl_int3472_tps68470_calc_type(adev);
>    173		switch (device_type) {
>    174		case DESIGNED_FOR_WINDOWS:
>    175			board_data = int3472_tps68470_get_board_data(dev_name(&client->dev));
>    176			if (!board_data)
>    177				return dev_err_probe(&client->dev, -ENODEV, "No board-data found for this model\n");
>    178	
>    179			cells = kcalloc(TPS68470_WIN_MFD_CELL_COUNT, sizeof(*cells), GFP_KERNEL);
>    180			if (!cells)
>    181				return -ENOMEM;
>    182	
>    183			/*
>    184			 * The order of the cells matters here! The clk must be first
>    185			 * because the regulator depends on it. The gpios must be last,
>    186			 * acpi_gpiochip_add() calls acpi_dev_clear_dependencies() and
>    187			 * the clk + regulators must be ready when this happens.
>    188			 */
>    189			cells[0].name = "tps68470-clk";
>    190			cells[0].platform_data = clk_pdata;
>    191			cells[0].pdata_size = struct_size(clk_pdata, consumers, n_consumers);
>    192			cells[1].name = "tps68470-regulator";
>    193			cells[1].platform_data = (void *)board_data->tps68470_regulator_pdata;
>    194			cells[1].pdata_size = sizeof(struct tps68470_regulator_platform_data);
>    195			cells[2].name = "tps68470-gpio";
>    196	
>    197			gpiod_add_lookup_table(board_data->tps68470_gpio_lookup_table);
>    198	
>    199			ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
>    200						   cells, TPS68470_WIN_MFD_CELL_COUNT,
>    201						   NULL, 0, NULL);
>    202			kfree(cells);
>    203	
>    204			if (ret)
>    205				gpiod_remove_lookup_table(board_data->tps68470_gpio_lookup_table);
>    206	
>    207			break;
>    208		case DESIGNED_FOR_CHROMEOS:
>    209			ret = devm_mfd_add_devices(&client->dev, PLATFORM_DEVID_NONE,
>    210						   tps68470_cros, ARRAY_SIZE(tps68470_cros),
>    211						   NULL, 0, NULL);
>    212			break;
>    213		default:
>    214			dev_err(&client->dev, "Failed to add MFD devices\n");
>    215			return device_type;
>    216		}
>    217	
>    218		/*
>    219		 * No acpi_dev_clear_dependencies() here, since the acpi_gpiochip_add()
>    220		 * for the GPIO cell already does this.
>    221		 */
>    222	
>    223		return ret;
>    224	}
>    225	
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

