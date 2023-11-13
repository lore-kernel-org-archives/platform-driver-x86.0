Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD59C4332F
	for <platform-driver-x86@archiver.kernel.org>; Mon, 13 Nov 2023 16:01:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231419AbjKMQBN (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Mon, 13 Nov 2023 11:01:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbjKMQBM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2023 11:01:12 -0500
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9657B1711
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 08:01:07 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66fa16092c0so28368786d6.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 08:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699891266; x=1700496066; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Qoo4HeqyB8XJlWsHMhO4dBiMIsId95k48Rfp0Zw5T3s=;
        b=c1iFOr9Tf5P/IiChw+9CHyFh3TPN/IwvTuYeJ0wp323FBnklPygAmCY0YIZVHhDQ1r
         ZxKpTBNLPDpk/EdIHk35UZ/ObgxvnUDRrnXFb6Jr2HjcBM3NNg4LaYBk6aTK5IaNZZ8I
         AHqHGENhQK8h9CVNhY0cvyFWPJd6yZhQMuiYDKXa86gzVl1TN8NzCT1I03B8p4+aUc+4
         1FmRIVMbhD6O9Ey9XWE4nKXPuRutEU/UyC4KVUVhTZ0g+uDPsvpXi3Jmy3uDUQoUVRjf
         tozwJmXqVOL927wzy4w49tDmOfaN4mmMSxaf67duGUDEe94dDSE8tQvNa66myU4+g9xw
         W5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699891266; x=1700496066;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Qoo4HeqyB8XJlWsHMhO4dBiMIsId95k48Rfp0Zw5T3s=;
        b=vxKw03iwMKBZsWOuC1lnOVqBdYtpaPFxJu1PxNkL90QDOEumwkM2UfZql0UkJpO4u5
         ugp7UeJeRw9CxU4/ISbZoYznFZB+A0ph+zOosLOLoisqihgVyP9s9gj1EEDtJvzJKBGf
         dXFx3barLkBu1j2uIzKhvcwz71PiqUGg804epEhzA4IQxhe389l2zMNBdjWtKMh+BY5T
         zUe1UEYwjqXJKOVV4pT1vSz3e9OkycTuh3+BSQy8bxkkj6Or/2+gcTPYFAlgCSG1wDhX
         nOG5PIf2qx6tX8Yl1+61nnqMCljLEv76FMRtWYQfVT/DnZBklzJppgIwpHH+VyFmfV5m
         vSCQ==
X-Gm-Message-State: AOJu0YzyiHcxySy5Kx7vouCinddpXPfmQdbsXe/NDoRYcMWd/CGD+cG0
        RPmQ36pACM8O5mX1HebV55vcJA==
X-Google-Smtp-Source: AGHT+IG5zJ5b6dVPypoKcfuICu/un+SYe6KNcnPElYEe5tHaxVY9lQoNx4dz5v0y9ZW2DHWkXiOg7w==
X-Received: by 2002:a05:6214:a94:b0:66f:bb58:c150 with SMTP id ev20-20020a0562140a9400b0066fbb58c150mr7312476qvb.56.1699891266772;
        Mon, 13 Nov 2023 08:01:06 -0800 (PST)
Received: from localhost ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id cy20-20020a05621418d400b00670e7ae4964sm2153685qvb.91.2023.11.13.08.01.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 08:01:06 -0800 (PST)
Date:   Mon, 13 Nov 2023 19:01:04 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc:     Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, error27@gmail.com,
        vegard.nossum@oracle.com, darren.kenny@oracle.com,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 4/4] platform/x86: hp-bioscfg: Fix error handling in
 hp_add_other_attributes()
Message-ID: <bd9e80db-a80f-44d1-bcb9-a14ec0abc64f@suswa.mountain>
References: <20231110142921.3398072-1-harshit.m.mogalapalli@oracle.com>
 <20231110142921.3398072-4-harshit.m.mogalapalli@oracle.com>
 <211e6c1e-9bfa-ac29-b6ba-e198c4f36688@linux.intel.com>
 <fb97e3ea-1bee-4d7d-a8d4-dd76107f75ef@oracle.com>
 <1b58df2d-b444-ddb7-7533-9911d35f8f7@linux.intel.com>
 <c3b821fb-5df1-4c58-99bc-f3e99a6d1d94@oracle.com>
 <a0b5d36a-aad8-eaf5-7241-85d1c874ff8@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a0b5d36a-aad8-eaf5-7241-85d1c874ff8@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 13, 2023 at 04:15:50PM +0200, Ilpo Järvinen wrote:
> This relates to the 2nd problem (missing kobject_put()) and will be 
> covered by the other patch. Don't try to solve this in the first patch
> at all!
> 
> There are two indepedent problems:
> - Before kobject_init_and_add(), kfree() is missing
> - After kobject_init_and_add(), kobject_put() is missing

It's the same problem, though.  The attr_name_kobj is leaked on all the
error paths.  It's just that it needs to be freed different ways
depending on where you are.  To me splitting it up makes it harder to
review and I would not allow it in Staging.  You can't fix half the
problem.

regards,
dan carpenter

