Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82964C76195
	for <platform-driver-x86@archiver.kernel.org>; Mon, 27 Mar 2023 11:25:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230212AbjC0LZw (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 27 Mar 2023 07:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjC0LZw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Mar 2023 07:25:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EB31423A;
        Mon, 27 Mar 2023 04:25:51 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AD5AFB810DC;
        Mon, 27 Mar 2023 11:25:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4099EC433EF;
        Mon, 27 Mar 2023 11:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679916348;
        bh=MXjfr1ztZM/qPArTGl5+3aYKkvb9xk9LTYVhR8LjnI4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kPAUuHNvBq9UD8MajLJCn8yHl/oB/D3m2nZeczSUnh97ZA3VrT0CRAR5RJJGz/XAO
         iw1SfVZ+qGvlYArlVRMlSldooy8CmYxgB42jr9Wz1MMDDKldzJIby0SXV5dzOsyJcZ
         m9mdHAKFx2ihppQqX1dPMbMrGKvmKNJRpaTKnUHgZFyTwnm3c5+APfj4Uw3BvBt8iG
         h9RDa14mrJLRNBC2o9LiXAlf+grA5acawYXR0AU8eWAUkhktKtS8Wc/PKSWY+J2eo/
         JJlp2DBbzGD3wmEwasAN8kLRmN0CFriEyc0LS83F7l7PhRbSn7tg+dLnWMIKV09LA0
         KHf9DLWH4un5g==
Date:   Mon, 27 Mar 2023 07:25:47 -0400
From:   Sasha Levin <sashal@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH AUTOSEL 5.10 12/15] platform/x86: ISST: Increase range of
 valid mail box commands
Message-ID: <ZCF9OxyAnn8UT6w0@sashalap>
References: <20230320005559.1429040-1-sashal@kernel.org>
 <20230320005559.1429040-12-sashal@kernel.org>
 <ZBhkpDB5xSfP+MAK@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <ZBhkpDB5xSfP+MAK@duo.ucw.cz>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 20, 2023 at 02:50:28PM +0100, Pavel Machek wrote:
>Hi!
>
>> From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>>
>> [ Upstream commit 95ecf90158522269749f1b7ce98b1eed66ca087b ]
>>
>> A new command CONFIG_TDP_GET_RATIO_INFO is added, with sub command type
>> of 0x0C. The previous range of valid sub commands was from 0x00 to 0x0B.
>> Change the valid range from 0x00 to 0x0C.
>
>Not sure why this was selected for stable.
>
>We don't have CONFIG_TDP_GET_RATIO_INFO in 5.10, so we should not have
>this.

I'll drop it, thanks!

-- 
Thanks,
Sasha
