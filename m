Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F618C0015E
	for <platform-driver-x86@archiver.kernel.org>; Sat, 22 Jul 2023 19:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjGVTRk (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 22 Jul 2023 15:17:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229505AbjGVTRh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Jul 2023 15:17:37 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 22 Jul 2023 12:17:35 PDT
Received: from so254-32.mailgun.net (so254-32.mailgun.net [198.61.254.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7693EE65
        for <platform-driver-x86@vger.kernel.org>; Sat, 22 Jul 2023 12:17:35 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt;
 s=mx; t=1690053454; x=1690060654; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=WQzZK+blyTCu7eLt0L8ry7tHXhEBXBc4LGk52ofwZsI=;
 b=V9vnMnGUBVkbrby8htPa2LcJvOi5AObWX0vDc8MfHjQeLN21asuQU2hSBEAKIXov2gyhlvtck9tOMDnVtCnUWDBmQQ5Ad4vu1l4LNAxkHhQD/H5NdTZfvnulDkwpmfuerzPsr3YR8ztn/7TdIxPd2QrvROTenUuT9ZeOcKJ7+TcvC5zD3qaPBduW+IJvJH5JESS7HG7sX39ifKagwTM6ARyYHFsizAHfgKmMiyUtMVAONmeNimhW8Gpbnhspr3NvziEAkPqDJlTcBGCyFD0Lczk4Q2t+OxvVlWUrLlHAuoNBBQppmVAf7ZWUab3eILojvuFsyvC7qbWi56wy/jat3g==
X-Mailgun-Sending-Ip: 198.61.254.32
X-Mailgun-Sid: WyI0MzAwNyIsInBsYXRmb3JtLWRyaXZlci14ODZAdmdlci5rZXJuZWwub3JnIiwiOTNkNWFiIl0=
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by 23c5fbb932a2 with SMTP id
 64bc2a21cd5627293bffe735 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 22 Jul 2023 19:12:33 GMT
Sender: james@equiv.tech
Date:   Sat, 22 Jul 2023 12:12:32 -0700
From:   James Seo <james@equiv.tech>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] docs: hwmon: hp-wmi-sensors: Change document title
Message-ID: <ZLwqIIq0yj3gejEX@equiv.tech>
References: <20230722172513.9324-1-james@equiv.tech>
 <20230722172513.9324-3-james@equiv.tech>
 <7a689374-25bd-4b82-acbe-159fb85a2347@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7a689374-25bd-4b82-acbe-159fb85a2347@roeck-us.net>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jul 22, 2023 at 11:24:18AM -0700, Guenter Roeck wrote:
> On Sat, Jul 22, 2023 at 10:25:14AM -0700, James Seo wrote:
>> Change title to "Kernel driver hp-wmi-sensors" for consistency with
>> most of the rest of Documentation/hwmon.
> 
> Not sure if it is worth it, but either case: Signed-off-by: missing.
> 
> Guenter

Oops. Forget it for now, then. I'll resubmit if/when there are more changes.

Thanks.

James

