Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE7C6182D7
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 09:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200672; cv=none; b=CoNZDi1ZFC8IENYe00b/yPYVynu+WjcEKYcZ98cAzZkXwdmBB7Vv933HO7QSi4B8QDoFABlw3NaKI8DZCSlNww9qze/f1cMRlzljxj38SFybTkdg+/KhMlJ7Lx2D87sFWXK8uY8JZKo15fPk0+uGEC+JBU8cPy2mu6xmCJiY8CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200672; c=relaxed/simple;
	bh=yTiI1SbKxVng2ms5oapwCg9Z1rqdn+aKZKdaAtaL/p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=S8AX5bgcBLYgCm3j82wUPnZExIfHFDxFxgBt/dQy22RimJOAWvPyMY2t2y8EHI69UF2YiF1iW4gsC/mHtuLgU3ZrH66xAbBeLxihXcwM5gGi8yjToObb0mZhuRgx4QDewMLDgyDfvE0WJpcNhOnOa3Jdv/jqSRF+oNm/orMoVnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LnsHzN3Y; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LnsHzN3Y"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a3798794d3so1474650f8f.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Jun 2025 02:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200669; x=1749805469; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MroWZLh94tghDEJPmpl0e2rk1Z2stRREO+LmawTdMM8=;
        b=LnsHzN3Y3UOC8rCSBLgN9j5iB+Ii3qqCKHPL0xjQgSj4CgQiqGnERNDBHRc7eeIdua
         xXjrdwprhZ12ifH0eXlAhjXb+dncCQxQcwS2SEp0TrVDw9D1XRG5O1b+0GairsqNyppg
         VGNNPNdirwPr3/SWxjtNiNpP5nPXcLaxyOvIObucQOGfLUCdE1D5+L49TUzNSttCtLQT
         ZjFLuO19pn5zlS8xqU9ageksVf+RdcKCaiMXBAIDStU24SJ7ZeQewrLpRYKU1wEaJIDK
         sJZrjpGAcXTzv5U4grNQffP7Alm3jOwAsD/a8g5NiylNDDv08S9RLWj7xkbFzaI8+I1p
         I8zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200669; x=1749805469;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MroWZLh94tghDEJPmpl0e2rk1Z2stRREO+LmawTdMM8=;
        b=UDBAKRbjG1z14As+W3/84tn5C8ufs++aNRoE/oysx4emkYirrvDwXer+HINs6Js+kt
         e6Vu6hdoNeHpgC7GwA+kJH6UMzf2puFrZU3sO63wDjhUAlCKJ6ybnZycCKIOqHIP73+E
         J0oH2yVp1BFzgu6rcgnGE2Bm5yRDAvEsGY5o25LwrUKTWYOD8ri9dFhBJ7INQ58zXl3F
         lz+f9sQQ2iuiGamrkxhfVMlcT8TpGGWfhL122L5hRBdRElwYsIio3iGqcqc//O+RUfKS
         L4Cs9QeImg55lG69HUwALzygyo1HFd0XQHBR8JE1WJjWn8j0/+nxWew1bNpsx8EXPcS1
         ZWYg==
X-Gm-Message-State: AOJu0Yx1RK0HRn8O41gG/+FYulqx39xrY8ImkybGWAorPjodhd039WZl
	3b+gR7TDmOiAD4RZfVDpDNbTfkPr9A0AKPQicHdHvvPD8d2ygyLVStuNKEJ3ynNFrjg=
X-Gm-Gg: ASbGnctYou0er/ZQ4jBCxu7tAe9Wzp1ngIJEEPzjpQYNVxAqvbI8SiE6WEkAdnkXM4L
	fgXhYp/KvDYQe3eYMbZAldqmjw0g7so+A4/BDxKq4TpUZOe2a0EfVA5d2ZM8dEdWNOVxDAgJUtz
	EOpGWFgVnSwUGoWsD83/KdTB6N8OdPWJ+HY5vvdtntiOn6bjE6249p0SleHygv27y3TUKsxaUok
	un6TchENcE9QdxyF92SzEESAbiz/Xd/wJA/ogTKhamrwZzPGTAwui9mXSRcyenvat6ljgrp9ADp
	EYaqv8yrbov/n1dB+9NbLSG1FXSP0+Fv+h99iE63bx7wR3fpCGWzjzmH
X-Google-Smtp-Source: AGHT+IEOF6xNJJtVsKM1QHgoicDUF7FheqwdytZi5C/LdxVQixtC1ZxA8ebCaVsloXhYl1EsShKtxQ==
X-Received: by 2002:a05:6000:144e:b0:3a4:d79a:35a6 with SMTP id ffacd0b85a97d-3a531ab5032mr2169852f8f.14.1749200669064;
        Fri, 06 Jun 2025 02:04:29 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a532436871sm1245716f8f.49.2025.06.06.02.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:28 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86/intel-uncore-freq: Add attributes to show
 die_id
Message-ID: <aEKvGCLd1qmX04Tc@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Srinivas Pandruvada,

Commit 247b43fcd872 ("platform/x86/intel-uncore-freq: Add attributes
to show die_id") from May 8, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c:607 uncore_probe()
	error: we previously assumed 'plat_info' could be null (see line 514)

drivers/platform/x86/intel/uncore-frequency/uncore-frequency-tpmi.c
    465 static int uncore_probe(struct auxiliary_device *auxdev, const struct auxiliary_device_id *id)
    466 {
    467         bool read_blocked = 0, write_blocked = 0;
    468         struct intel_tpmi_plat_info *plat_info;
    469         struct tpmi_uncore_struct *tpmi_uncore;
    470         bool uncore_sysfs_added = false;
    471         int ret, i, pkg = 0;
    472         int num_resources;
    473 
    474         ret = tpmi_get_feature_status(auxdev, TPMI_ID_UNCORE, &read_blocked, &write_blocked);
    475         if (ret)
    476                 dev_info(&auxdev->dev, "Can't read feature status: ignoring blocked status\n");
    477 
    478         if (read_blocked) {
    479                 dev_info(&auxdev->dev, "Firmware has blocked reads, exiting\n");
    480                 return -ENODEV;
    481         }
    482 
    483         /* Get number of power domains, which is equal to number of resources */
    484         num_resources = tpmi_get_resource_count(auxdev);
    485         if (!num_resources)
    486                 return -EINVAL;
    487 
    488         /* Register callbacks to uncore core */
    489         ret = uncore_freq_common_init(uncore_read, uncore_write);
    490         if (ret)
    491                 return ret;
    492 
    493         /* Allocate uncore instance per package */
    494         tpmi_uncore = devm_kzalloc(&auxdev->dev, sizeof(*tpmi_uncore), GFP_KERNEL);
    495         if (!tpmi_uncore) {
    496                 ret = -ENOMEM;
    497                 goto err_rem_common;
    498         }
    499 
    500         /* Allocate memory for all power domains in a package */
    501         tpmi_uncore->pd_info = devm_kcalloc(&auxdev->dev, num_resources,
    502                                             sizeof(*tpmi_uncore->pd_info),
    503                                             GFP_KERNEL);
    504         if (!tpmi_uncore->pd_info) {
    505                 ret = -ENOMEM;
    506                 goto err_rem_common;
    507         }
    508 
    509         tpmi_uncore->power_domain_count = num_resources;
    510         tpmi_uncore->write_blocked = write_blocked;
    511 
    512         /* Get the package ID from the TPMI core */
    513         plat_info = tpmi_get_platform_data(auxdev);
    514         if (plat_info)

The old code assumes plat_info can be NULL.

    515                 pkg = plat_info->package_id;
    516         else
    517                 dev_info(&auxdev->dev, "Platform information is NULL\n");
    518 
    519         for (i = 0; i < num_resources; ++i) {
    520                 struct tpmi_uncore_power_domain_info *pd_info;
    521                 struct resource *res;
    522                 u64 cluster_offset;
    523                 u8 cluster_mask;
    524                 int mask, j;
    525                 u64 header;
    526 
    527                 res = tpmi_get_resource_at_index(auxdev, i);
    528                 if (!res)
    529                         continue;
    530 
    531                 pd_info = &tpmi_uncore->pd_info[i];
    532 
    533                 pd_info->uncore_base = devm_ioremap_resource(&auxdev->dev, res);
    534                 if (IS_ERR(pd_info->uncore_base)) {
    535                         ret = PTR_ERR(pd_info->uncore_base);
    536                         /*
    537                          * Set to NULL so that clean up can still remove other
    538                          * entries already created if any by
    539                          * remove_cluster_entries()
    540                          */
    541                         pd_info->uncore_base = NULL;
    542                         goto remove_clusters;
    543                 }
    544 
    545                 /* Check for version and skip this resource if there is mismatch */
    546                 header = readq(pd_info->uncore_base);
    547                 pd_info->ufs_header_ver = header & UNCORE_VERSION_MASK;
    548 
    549                 if (pd_info->ufs_header_ver == TPMI_VERSION_INVALID)
    550                         continue;
    551 
    552                 if (TPMI_MAJOR_VERSION(pd_info->ufs_header_ver) != UNCORE_MAJOR_VERSION) {
    553                         dev_err(&auxdev->dev, "Uncore: Unsupported major version:%lx\n",
    554                                 TPMI_MAJOR_VERSION(pd_info->ufs_header_ver));
    555                         ret = -ENODEV;
    556                         goto remove_clusters;
    557                 }
    558 
    559                 if (TPMI_MINOR_VERSION(pd_info->ufs_header_ver) > UNCORE_MINOR_VERSION)
    560                         dev_info(&auxdev->dev, "Uncore: Ignore: Unsupported minor version:%lx\n",
    561                                  TPMI_MINOR_VERSION(pd_info->ufs_header_ver));
    562 
    563                 /* Get Cluster ID Mask */
    564                 cluster_mask = FIELD_GET(UNCORE_LOCAL_FABRIC_CLUSTER_ID_MASK, header);
    565                 if (!cluster_mask) {
    566                         dev_info(&auxdev->dev, "Uncore: Invalid cluster mask:%x\n", cluster_mask);
    567                         continue;
    568                 }
    569 
    570                 /* Find out number of clusters in this resource */
    571                 pd_info->cluster_count = hweight8(cluster_mask);
    572 
    573                 pd_info->cluster_infos = devm_kcalloc(&auxdev->dev, pd_info->cluster_count,
    574                                                       sizeof(struct tpmi_uncore_cluster_info),
    575                                                       GFP_KERNEL);
    576                 if (!pd_info->cluster_infos) {
    577                         ret = -ENOMEM;
    578                         goto remove_clusters;
    579                 }
    580                 /*
    581                  * Each byte in the register point to status and control
    582                  * registers belonging to cluster id 0-8.
    583                  */
    584                 cluster_offset = readq(pd_info->uncore_base +
    585                                         UNCORE_FABRIC_CLUSTER_OFFSET);
    586 
    587                 for (j = 0; j < pd_info->cluster_count; ++j) {
    588                         struct tpmi_uncore_cluster_info *cluster_info;
    589 
    590                         /* Get the offset for this cluster */
    591                         mask = (cluster_offset & UNCORE_CLUSTER_OFF_MASK);
    592                         /* Offset in QWORD, so change to bytes */
    593                         mask <<= 3;
    594 
    595                         cluster_info = &pd_info->cluster_infos[j];
    596 
    597                         cluster_info->cluster_base = pd_info->uncore_base + mask;
    598 
    599                         uncore_set_agent_type(cluster_info);
    600 
    601                         cluster_info->uncore_data.package_id = pkg;
    602                         /* There are no dies like Cascade Lake */
    603                         cluster_info->uncore_data.die_id = 0;
    604                         cluster_info->uncore_data.domain_id = i;
    605                         cluster_info->uncore_data.cluster_id = j;
    606 
--> 607                         set_cdie_id(i, cluster_info, plat_info);
                                                             ^^^^^^^^^
But the patch adds an unchecked dereference.

    608 
    609                         cluster_info->uncore_root = tpmi_uncore;
    610 
    611                         if (TPMI_MINOR_VERSION(pd_info->ufs_header_ver) >= UNCORE_ELC_SUPPORTED_VERSION)
    612                                 cluster_info->elc_supported = true;
    613 
    614                         ret = uncore_freq_add_entry(&cluster_info->uncore_data, 0);
    615                         if (ret) {
    616                                 cluster_info->cluster_base = NULL;
    617                                 goto remove_clusters;
    618                         }
    619                         /* Point to next cluster offset */
    620                         cluster_offset >>= UNCORE_MAX_CLUSTER_PER_DOMAIN;
    621                         uncore_sysfs_added = true;
    622                 }
    623         }
    624 
    625         if (!uncore_sysfs_added) {
    626                 ret = -ENODEV;
    627                 goto remove_clusters;
    628         }
    629 
    630         auxiliary_set_drvdata(auxdev, tpmi_uncore);
    631 
    632         if (topology_max_dies_per_package() > 1)
    633                 return 0;
    634 
    635         tpmi_uncore->root_cluster.root_domain = true;
    636         tpmi_uncore->root_cluster.uncore_root = tpmi_uncore;
    637 
    638         tpmi_uncore->root_cluster.uncore_data.package_id = pkg;
    639         tpmi_uncore->root_cluster.uncore_data.domain_id = UNCORE_DOMAIN_ID_INVALID;
    640         ret = uncore_freq_add_entry(&tpmi_uncore->root_cluster.uncore_data, 0);
    641         if (ret)
    642                 goto remove_clusters;
    643 
    644         return 0;
    645 
    646 remove_clusters:
    647         remove_cluster_entries(tpmi_uncore);
    648 err_rem_common:
    649         uncore_freq_common_exit();
    650 
    651         return ret;
    652 }

regards,
dan carpenter
