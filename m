Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF93320393
	for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 07:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776928189; cv=none; b=LQiQEbCKgnP/AXO3txO3pN0PAMtD+dhw9jx4jVTGjT24iU1nI6V2pQbgs2yE8SsZ8c/rep2uZ+c18wpjlnMeATLBgwm/v+wOhoraNYhInLwO39lrU8Qcyz3T/M84wNyjk5OnJycLx6a6CeqplBOxAdWQNBbfDMCN0xiq721CApk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776928189; c=relaxed/simple;
	bh=947w7JpVeV7EL/12bzhdsGru+tp2dTqaLdeUK2+JAPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fNAzrStjUXbQh2hwM4etOwgiAzA+Xaf2J2PqiOtL2HZMzGDur7DlWgPfrNR/0LuZMSWsWPNyY3YmbjfUrFXI8y9kCncJkLykXDZiyuDw5rgQd/7c2ue3Rk1wWRBKa58K6p5tB4GXPzQvqFxfcsvEnGeQCPFkK6nYj3W3XQn/fCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K50Di+bS; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K50Di+bS"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-650775f427eso6831904d50.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2026 00:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776928187; x=1777532987; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qm2NqGJEYqcC6l0qKNTOEDu5FACZAmXYCmgwUMs+6Nk=;
        b=K50Di+bSJWJEICSIcNKUF8DyukvMyPd0hnX+v/YQtX93b16Zz6ce4hxSvrusFEtEGY
         63b9pgWZnA+2Zr+dshscRAEfIgUsQHAwrbFXtur+PTG/2xxXXblrk/rsbkYrgBLhn63E
         DFAp+1KGvzrhuFBDvWrlJG5ei09gu5VSFmL9ovprQMpVihSqaFd/UJw1W+lFeIOEdd7x
         O4QWYvVGeVjWByceup8ouk/rGNYNQ1dMRdPW7D0Kbt9k7ofUk3Y5Ipfw/00EJvEfvSR4
         4ipLdvp+rG5fbI5bJLELsFdTuh8UxMeS4fmSczZDpO2MGPp1uotjh9ljHUxN+RA0kQ3t
         fhUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776928187; x=1777532987;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qm2NqGJEYqcC6l0qKNTOEDu5FACZAmXYCmgwUMs+6Nk=;
        b=mNdJvLuiZCaxmj4fFjT2HksIvz0E7au/SSKP9/D6fKYllgT7mndUapfm+TN2UVf8jK
         h6LiobpXXptHTcMj6zOyWsPWwIx0waY4Gu6HcE9VNpq0TbqQdc/hfWrM5SJEIbFtBrST
         aafhxdN6wdu+PGnuNbhOZ1sbpXG34hA4eVj3LCAvEs3hboFTQ8xZWdOOK/r1uU11nuJq
         Hdh+/u3sGr86iYUOD/qFFqEKXGtbFLVIa3TsFI7ZHxLAoCmHUnCx9kes70r7gfKRHYOC
         qgalyu9TtjR7gkQ0ZMyW9ezT6E+Xe3R9gHMfAbnuNQOKoe9gJXci2TmCTomB9k3Ff80S
         vr5A==
X-Gm-Message-State: AOJu0YyR+7L1aGFbBnUdfv/sdcuLnsKnvKySEvv1sN9ER6QO2hQEoPLu
	cXVw2gukEdqzwjHYJu4OZwDH596LH1LcOIVDMHCyfhzwVjhpA4XqXgyRV8r2LNrk
X-Gm-Gg: AeBDietzKsSjv7QG6b7yZ5/PTXLMMizBCrsmGOFr+CoxcYGMumYImFBdvAltzhy1vVm
	0TzevhoFp16jMlvSCBcEUBLjoIp7bhsylnG6o06Cxf2MagYdX+O3J61jLtZ1Cs2kklBjX0+VgoH
	r+GbOFtOZ9MAPC9Gtz4vnuwYL0pQcCDdHINPahH9uPJAzp0wkDFb0jkPaQihgZe4ZM0z5rwzG1R
	a/dNHOznf1/6/+dltnjQJkdFMDR5en4zDjiwXme3PIA4NREBAuZ6JlrQt6S/PKDlkH5o9eVDUpf
	X9gl22E3ZoAftKzb9tfxcTGllxzp3gsMGmNUxBld6vG4Z4QPnp7MdzRD5PCjpm/QOtYyyXZ/zyq
	x2SfFxaTXqCO63xwCGrHFDIr11tbAVyVMmRfILF+KKhTrltXvmquUcpppaMpxRAw8Um4AmVBVG1
	XyPnfLNZniSXyXv0h7F73jzT7OxfPR
X-Received: by 2002:a53:acc9:0:10b0:653:c9e:306 with SMTP id 956f58d0204a3-6531086ddd1mr19638862d50.20.1776928186673;
        Thu, 23 Apr 2026 00:09:46 -0700 (PDT)
Received: from localhost ([172.216.252.33])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65314e328d6sm8800072d50.11.2026.04.23.00.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 00:09:46 -0700 (PDT)
Date: Thu, 23 Apr 2026 10:09:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86/amd/pmf: Add support for PMF-TA interaction
Message-ID: <aenFs-bOmM6VpO9W@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Shyam Sundar S K,

Commit ae82cef7d9c5 ("platform/x86/amd/pmf: Add support for PMF-TA
interaction") from Dec 12, 2023 (linux-next), leads to the following
Smatch static checker warning:

drivers/platform/x86/amd/pmf/tee-if.c:261 amd_pmf_invoke_cmd_enact() warn: set error code if 'arg.ret != 0'
drivers/platform/x86/amd/pmf/tee-if.c:307 amd_pmf_invoke_cmd_init() warn: set error code if 'arg.ret != 0'

drivers/platform/x86/amd/pmf/tee-if.c
    234 int amd_pmf_invoke_cmd_enact(struct amd_pmf_dev *dev)
    235 {
    236         struct ta_pmf_shared_memory *ta_sm = NULL;
    237         struct ta_pmf_enact_result *out = NULL;
    238         struct ta_pmf_enact_table *in = NULL;
    239         struct tee_param param[MAX_TEE_PARAM];
    240         struct tee_ioctl_invoke_arg arg;
    241         int ret = 0;
    242 
    243         if (!dev->tee_ctx)
    244                 return -ENODEV;
    245 
    246         memset(dev->shbuf, 0, dev->policy_sz);
    247         ta_sm = dev->shbuf;
    248         out = &ta_sm->pmf_output.policy_apply_table;
    249         in = &ta_sm->pmf_input.enact_table;
    250 
    251         memset(ta_sm, 0, sizeof(*ta_sm));
    252         ta_sm->command_id = TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES;
    253         ta_sm->if_version = PMF_TA_IF_VERSION_MAJOR;
    254 
    255         amd_pmf_populate_ta_inputs(dev, in);
    256         amd_pmf_prepare_args(dev, TA_PMF_COMMAND_POLICY_BUILDER_ENACT_POLICIES, &arg, param);
    257 
    258         ret = tee_client_invoke_func(dev->tee_ctx, &arg, param);
    259         if (ret < 0 || arg.ret != 0) {
    260                 dev_err(dev->dev, "TEE enact cmd failed. err: %x, ret:%d\n", arg.ret, ret);
--> 261                 return ret;

return ret ?: -EINVAL?  (not sure what kind of error codes are stored in
arg.ret).

    262         }
    263 
    264         if (ta_sm->pmf_result == TA_PMF_TYPE_SUCCESS && out->actions_count) {
    265                 amd_pmf_dump_ta_inputs(dev, in);
    266                 dev_dbg(dev->dev, "action count:%u result:%x\n", out->actions_count,
    267                         ta_sm->pmf_result);
    268                 amd_pmf_apply_policies(dev, out);
    269         }
    270 
    271         return 0;
    272 }

This email is a free service from the Smatch-CI project [smatch.sf.net].

regards,
dan carpenter
