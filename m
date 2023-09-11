Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21D2EEB58C
	for <platform-driver-x86@archiver.kernel.org>; Mon, 11 Sep 2023 04:31:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233656AbjIKEbt (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 11 Sep 2023 00:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233495AbjIKEbr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 00:31:47 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711F810C;
        Sun, 10 Sep 2023 21:31:41 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58BE2C433B9;
        Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694406700;
        bh=zdcZgXW0ruaLVCHmFcQtUtGqAyV2q7CuqMdsj8JHKuo=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=COLJDnyyEjxhCZBFxpK7LIlk1XtdvbEadTmHY9z4p8ki/idJTloI7wpINVoJOl3by
         uTAkOWhbvR8voDbwNZSWAXynKhe2amo7pFjTN65/RT/UgjUf9WMolSih5tSxL1CJH5
         fJfQN0885GhuWGN3TAiTL0dp6urQ9wytnuAPc3cVnok1SdrW9Aw9q4Kr8fuX4JbuVn
         4/O3QhEYGcwsjY2y0RJoMMELYEfBbyS4Nxxmr9lCzUdmw0NcUCz0t7biZ4FIZeBiPH
         zrVtmDo0ptK8bDfJdJHOb1cHgHoxgE+semYfT3RCWBYU4uza6q7+vIDg+2z8TAm4QP
         Jex7WtsQb5JNQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 456BEE22AFF;
        Mon, 11 Sep 2023 04:31:40 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] platform: Explicitly include correct DT includes
From:   patchwork-bot+chrome-platform@kernel.org
Message-Id: <169440670028.22573.1520676346126156762.git-patchwork-notify@kernel.org>
Date:   Mon, 11 Sep 2023 04:31:40 +0000
References: <20230714174909.4062739-1-robh@kernel.org>
In-Reply-To: <20230714174909.4062739-1-robh@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     bleung@chromium.org, groeck@chromium.org, hdegoede@redhat.com,
        markgross@kernel.org, vadimp@nvidia.com,
        devicetree@vger.kernel.org, chrome-platform@lists.linux.dev,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello:

This patch was applied to chrome-platform/linux.git (for-kernelci)
by Hans de Goede <hdegoede@redhat.com>:

On Fri, 14 Jul 2023 11:49:09 -0600 you wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Here is the summary with links:
  - platform: Explicitly include correct DT includes
    https://git.kernel.org/chrome-platform/c/b9fe9c9ef97d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


