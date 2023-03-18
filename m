Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0192DC61DA4
	for <platform-driver-x86@archiver.kernel.org>; Sat, 18 Mar 2023 08:56:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbjCRI4b (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Sat, 18 Mar 2023 04:56:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbjCRI4a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 18 Mar 2023 04:56:30 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717B44D62D
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 01:56:24 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id az3-20020a05600c600300b003ed2920d585so6359165wmb.2
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Mar 2023 01:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679129782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fPRPwQTH6rfxXKnRVYlQr/YgBm6Bi1FlsqYJtitlRz0=;
        b=cEkbuQjYOp21bdmZOAW2YdVJbsEnG7/RlYpn4LqwO4bZrOCF3Vp9piqjeYmlJ9j/Dm
         qXNdy8zL632FUQntb14HlGRr9gTfZgP12vmyl+SngqeZYUUceYjMLyDgjtk2I7vd2NFf
         o4JRNC1BRB7cIqYpUergeC2w6yznSKZLgTrCo6LkvLzxChAl9gxVwIlp+aOap1ptVuwA
         SyENCjm84dM+PSr8NbutNTNpWas09GqiC5WOpNCZLmPe0rxJwq+U9UzHuGMompXh7qrE
         ZADw8QhFBwWeJjyQ8Dyassh1q56+UOA2v3MMwKYUDi9IpGR5Jv88U3gK28FK9YbRvhqE
         FEvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679129782;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fPRPwQTH6rfxXKnRVYlQr/YgBm6Bi1FlsqYJtitlRz0=;
        b=FS7OC7QcOclm0ynX/8fnNakIeaA6kPx9Z+4UcxN8uyyyqS3ZxqlJYQsrIrMfNs+Mnr
         05absP+U6mzNK0hg0l+9S5gwqXO7hynOsiEqQlF7f4pgKeiesxlSG1v8x5d9CnAZfSfe
         yCnx6IuvWS2VKnErthFzKFpw4jRuB+wRRVX9gmxB8jG6FKVJWmTuF9npUYrJ73FgkQMV
         73NheqJxF1FRYOtTGny1uoxJ+7PasmtgFCEsHLcXpzUfKhPMT4M0rRSHCc652QgIRTIj
         Nhf1qDqenhspxBYhiwGNJwXM4cVvW6L3XPDWH7+n/vZoQjOrGEOl5uo4CIknNjsYmA+4
         ooIQ==
X-Gm-Message-State: AO0yUKXkqZJzrdbwlZARYbHbj2VvlQCceGSrfzpW+iQ/AhsoaHVcHdNA
        K4I9y/ToN+XppOG6dICGun5dCwoES3w=
X-Google-Smtp-Source: AK7set8CY3tt51XyIbLSpsA6MapipG5O0g5bKpp5CR7c5ZPbL7ubR+RO6RU31FKU1Y10c1eaHSyOoQ==
X-Received: by 2002:a7b:c845:0:b0:3ed:76c3:50e9 with SMTP id c5-20020a7bc845000000b003ed76c350e9mr4860361wml.17.1679129782564;
        Sat, 18 Mar 2023 01:56:22 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003ed2987690dsm4220823wmr.26.2023.03.18.01.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Mar 2023 01:56:22 -0700 (PDT)
Date:   Sat, 18 Mar 2023 11:56:11 +0300
From:   Dan Carpenter <error27@gmail.com>
To:     srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [bug report] platform/x86: ISST: Add IOCTL default callback
Message-ID: <9ca2c670-91eb-4250-a451-37d1ced74a99@kili.mountain>
References: <25a8ef35-5274-4990-a683-040aacaa8d3a@kili.mountain>
 <c6e93a83e9605ca127483dc3e7dbcf97c6961e06.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6e93a83e9605ca127483dc3e7dbcf97c6961e06.camel@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Mar 16, 2023 at 12:02:04PM -0700, srinivas pandruvada wrote:
> Hi Dan,
> 
> On Fri, 2023-03-10 at 14:57 +0300, Dan Carpenter wrote:
> > Hello Srinivas Pandruvada,
> > 
> > The patch 33c16dc1a2d1: "platform/x86: ISST: Add IOCTL default
> > callback" from Feb 10, 2023, leads to the following Smatch static
> > checker warning:
> > 
> >         drivers/platform/x86/intel/speed_select_if/isst_if_common.c:6
> > 29 isst_if_def_ioctl()
> >         info: return a literal instead of 'ret'
> > 
> I use your blog
> https://blogs.oracle.com/linux/post/smatch-static-analysis-tool-overview-by-dan-carpenter
> 
> smatch/smatch_scripts/kchecker --spammy
> drivers/platform/x86/intel/speed_select_if/isst_if_common.c
>   CHECK   scripts/mod/empty.c
>   CALL    scripts/checksyscalls.sh
>   DESCEND objtool
>   INSTALL libsubcmd_headers
>   CC [M]  drivers/platform/x86/intel/speed_select_if/isst_if_common.o
>   CHECK   drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> 
> Also tried with 
> https://smatch.sourceforge.net/
> 
> make CHECK="~/path/to/smatch/smatch -p=kernel" C=1 \
>                 bzImage module
> 
> What is the correct way to run this to get this error?
> 

Sorry, I haven't published this check, yet.  I'm still working through
some bugs in it.  You would think that a check like this would be
really simple, but Smatch warns about stuff like:

	ret = sunxi_nfc_hw_ecc_read_chunks_dma(nand, buf, oob_required, page,
					       nand->ecc.steps);
	if (ret >= 0)
		return ret;

For some reason in my system Smatch thinks
sunxi_nfc_hw_ecc_read_chunks_dma() only returns zero.  Which is bogus
and I need to fix it before I can publish the check.

(That might be a bug from something I did yesterday.  My build is very
messed up right now.  But there are other weirdnesses...)

regards,
dan carpenter

