Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0FF1C433DB
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 15:53:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 57F536186A
	for <platform-driver-x86@archiver.kernel.org>; Mon, 22 Mar 2021 15:53:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229870AbhCVPxS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 22 Mar 2021 11:53:18 -0400
Received: from mga09.intel.com ([134.134.136.24]:47408 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230319AbhCVPxJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 22 Mar 2021 11:53:09 -0400
IronPort-SDR: hJDC15ROJmIjjRcjEzfCEoGHFnOpi3T7LV1BMJDzYFMDbWgyxkaP/bcqrza35gxFXJjZDgsAMA
 brs93IcbcEFA==
X-IronPort-AV: E=McAfee;i="6000,8403,9931"; a="190391719"
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="190391719"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 08:53:07 -0700
IronPort-SDR: Z47juyE8m6ITb/B8rH3nG+QDylFyKXbk4DrllZ4mIzp4j9yqTR7dwTRtgnQcCikwZ2MaEmvjyq
 O4Adoixoz2qA==
X-IronPort-AV: E=Sophos;i="5.81,269,1610438400"; 
   d="scan'208";a="451782523"
Received: from kaschuma-mobl1.amr.corp.intel.com (HELO [10.212.220.31]) ([10.212.220.31])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2021 08:53:05 -0700
Subject: Re: [PATCH v4 1/2] platform/x86: dell-privacy: Add support for Dell
 hardware privacy
To:     Perry Yuan <perry979106@gmail.com>,
        "Yuan, Perry" <Perry.Yuan@dell.com>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>,
        "oder_chiou@realtek.com" <oder_chiou@realtek.com>,
        "perex@perex.cz" <perex@perex.cz>,
        "tiwai@suse.com" <tiwai@suse.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "Limonciello, Mario" <Mario.Limonciello@dell.com>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <20210301093753.16300-1-Perry_Yuan@Dell.com>
 <551e30d2-0211-f3cb-fbb8-ee5b2f22a851@linux.intel.com>
 <SJ0PR19MB4528E7C88C955D2EE96CE3B484939@SJ0PR19MB4528.namprd19.prod.outlook.com>
 <ab14a0b2-3f3a-3796-8baf-76e635d82340@linux.intel.com>
 <58d2e2f2-e552-6ecf-b1c3-bf38ad5d2e35@gmail.com>
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Message-ID: <7e0fc125-5a26-47d6-aa2a-7cd1b2580adf@linux.intel.com>
Date:   Mon, 22 Mar 2021 09:49:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <58d2e2f2-e552-6ecf-b1c3-bf38ad5d2e35@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


> As you suggested,I should add the alignment change in another patch.
> But if i keep the old alignment, the code will be very odd.
> Seems like that I have to change the below code to new alignment in this 
> patch.
> 
> if (dell_smbios_find_token(GLOBAL_MIC_MUTE_DISABLE) &&
>      dell_smbios_find_token(GLOBAL_MIC_MUTE_ENABLE)) { <<--- changed back
>      if (!privacy_valid)
>              has_privacy = true;
>      else
>              has_privacy = false;
>      if (!has_privacy) {
>          micmute_led_cdev.brightness <<----------- new alignment
>          ...
>      }
> ...
> }

I don't get the point, sorry. The code above doesn't seem properly 
indented or there were spurious tab/spaces conversions?
