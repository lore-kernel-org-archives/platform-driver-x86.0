Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4785EEE4993
	for <platform-driver-x86@archiver.kernel.org>; Mon, 21 Aug 2023 12:57:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235090AbjHUM57 (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 21 Aug 2023 08:57:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230486AbjHUM57 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Aug 2023 08:57:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6992D3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 05:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1692622634;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DG5H5KOcPmVqVdZBZ1dpJdmfRI18LPGPu7BoYIzDGYc=;
        b=OD64yPRacS9WdUKnH4Q3mZyM1H7cHd/9GL5jkTQ35Xy63m9Yr179QZ0s81HP6C0ymJteg+
        gNE6l4hKr4p8SJn1lxHWeuAnA8tVX4betiLAhvoTWjFgisFOjO9YJqaJxa11bKDSPB2Ub9
        fp2peo2nbF974fRUWrvRIBEqipWIWYc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-183-m22Xz2R6PbWk39jQtpyPog-1; Mon, 21 Aug 2023 08:57:12 -0400
X-MC-Unique: m22Xz2R6PbWk39jQtpyPog-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a34d3e5ebso209443566b.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Aug 2023 05:57:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692622631; x=1693227431;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DG5H5KOcPmVqVdZBZ1dpJdmfRI18LPGPu7BoYIzDGYc=;
        b=g/QBhm/U/Qt2Hs0qGkShxhtJ2UcHSYnYUuSfzpbjpIAXSDyYRmVMF4Q895xCa+X14/
         0RVSg1qIuZF1s3DAcOzPuS+SIdAEU7FmOuTs+CgM2gXGrZ6BKu/DuEVjy9OutoqKB0qL
         4dXXymH41EpJV4LbjY1GbpuZn24IdW3wIuHD/sgJUo15A61HbxD4XxlFoIjIdMmffa3S
         mkn7rf+bY0jjFvBvR+wvR6tfymeT+AqPRp3+Sm/otHcjXD9N4SNYVuMEJ6ricQ+nB8DW
         39a0qzP1VsSrV3u67KcuxJ9RERVoCyMfxoqV/DqfjyzyzjJ+iZ40VUkRKsuMzi03/Wu9
         DM2g==
X-Gm-Message-State: AOJu0Yz9wXH1VjQLJ/wD2p8qtjt0DHSbOQIFPzhnhF7CFC5x+E50VHVm
        OHPV/vqVHe/F9ze23+y5h+0hmSwjgjfmBXsuRQnzbcVqht8E9q3DmpSiHyHNZG6LLw4oLH0H1AS
        XAQuGniFZZkuENupmOWPWVQZ97TWqA4rZLg==
X-Received: by 2002:a17:906:5dd9:b0:993:d617:bdc2 with SMTP id p25-20020a1709065dd900b00993d617bdc2mr4485315ejv.75.1692622631633;
        Mon, 21 Aug 2023 05:57:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEm5KYtbLWBJZpNSL+8ZGHWYiGmsCwGDMpLWndDydcI+49plyiTZ3YVZtTZSDcVel1IBXqyA==
X-Received: by 2002:a17:906:5dd9:b0:993:d617:bdc2 with SMTP id p25-20020a1709065dd900b00993d617bdc2mr4485305ejv.75.1692622631332;
        Mon, 21 Aug 2023 05:57:11 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id m18-20020a170906581200b0099364d9f0e2sm6513359ejq.98.2023.08.21.05.57.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Aug 2023 05:57:10 -0700 (PDT)
Message-ID: <2c0ee105-8610-5698-a729-8d665b9318b3@redhat.com>
Date:   Mon, 21 Aug 2023 14:57:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/4] Updates to amd-pmc driver
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     Sanket.Goswami@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org
References: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230811112116.2279419-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Shyam,

On 8/11/23 13:21, Shyam Sundar S K wrote:
> This patch series includes:
> 
> - Move PMC driver to separate directory

This one seems to rely on the state of the amd-pmc code in pdx86/fixes
which is also the state in Linus' master but not the state in pdx86/for-next
which is based on 6.5-rc1 where as e.g. :

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?h=fixes&id=e8ef8dd28c4c4b86cd3010ff42c79582f766862e

Which adds the pmc-quirks.c file was added later in the fixes branch.

So it is best to do this moving into a separate dir directly
after 6.6-rc1 is out, at which point fixes and for-next will have
both been merged.

> - Read SMU version at the time of probe to avoid duplication of code

Please address the comments made on this patch (or drop it).

I assume the rest relies on this patch, so I'm going to drop this
entire series from my queue now.

Regards,

Hans



> - Add a Firmware command that can force flush the Spill to DRAM contents.
> - override the STB dump size with a custom one using a module_param
> 
> 
> Shyam Sundar S K (4):
>   platform/x86/amd/pmc: Move PMC driver to separate directory
>   platform/x86/amd/pmc: Read SMU version at the time of probe
>   platform/x86/amd/pmc: Add PMFW command id to support S2D force flush
>   platform/x86/amd/pmc: Add dump_custom_stb module parameter
> 
>  MAINTAINERS                                   |  2 +-
>  drivers/platform/x86/amd/Kconfig              | 16 +---
>  drivers/platform/x86/amd/Makefile             |  3 +-
>  drivers/platform/x86/amd/pmc/Kconfig          | 19 +++++
>  drivers/platform/x86/amd/pmc/Makefile         |  8 ++
>  .../platform/x86/amd/{ => pmc}/pmc-quirks.c   |  0
>  drivers/platform/x86/amd/{ => pmc}/pmc.c      | 80 ++++++++-----------
>  drivers/platform/x86/amd/{ => pmc}/pmc.h      |  1 +
>  8 files changed, 66 insertions(+), 63 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmc/Kconfig
>  create mode 100644 drivers/platform/x86/amd/pmc/Makefile
>  rename drivers/platform/x86/amd/{ => pmc}/pmc-quirks.c (100%)
>  rename drivers/platform/x86/amd/{ => pmc}/pmc.c (96%)
>  rename drivers/platform/x86/amd/{ => pmc}/pmc.h (98%)
> 

