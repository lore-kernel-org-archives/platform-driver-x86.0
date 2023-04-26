Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F58DC77B78
	for <platform-driver-x86@archiver.kernel.org>; Wed, 26 Apr 2023 17:04:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbjDZREH (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Wed, 26 Apr 2023 13:04:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233451AbjDZREG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Apr 2023 13:04:06 -0400
Received: from mx0a-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EDF317ABD
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 10:04:05 -0700 (PDT)
Received: from pps.filterd (m0355795.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33QE933R007502
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 13:04:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=20180315;
 bh=R8tFVruHCR7iqeUzX56V8O1iXguuJVdoNbWvHu2Vu1k=;
 b=z28v6kKl4SOzb+YllBcxteKDlF4KamWE3aM/D+/5zRJhEfxY5YRLcxZ4yFeswCe8VrW0
 at7m6oCBFWzNV1DUD/QP64zUjkyMVYXdpPl2E13LDec0G5AGRceQ7g/VVy1px53sYzc1
 SrZYJZxTMt4wFYpk8qxRw8ViiYfueQ7vjYNosIChHdj+R49nynkNIalPiKqr29G2o0OF
 wdg1wLGDmntoY3/lRXURZbz+SFhWReowgSs2pZTQfVejnd5bf0R8nG6YFaFDT5uvl3Em
 M0HTsP09uKeXF7x3kV+imGOgRL+TqQyffvG9S+/JzRfx0wwmEp7hKMFbusRTXOGuh7od tg== 
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q486pcc4v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 13:04:05 -0400
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-74cef8ed06aso884409285a.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 26 Apr 2023 10:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682528644; x=1685120644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R8tFVruHCR7iqeUzX56V8O1iXguuJVdoNbWvHu2Vu1k=;
        b=CTJQXulpobXMmUm2dZT+N7e9UUXNB4paC985XLvbO47tzC/8QyknZ3kvDhjiX/i0cs
         jw4HUkcSs6BetBJRVWM/kEmy6BmQvr65gFFqmIHmP8xcpIO1awec1RCLxOLKZv0lVodT
         hPZ540Bmddo22fhrDxwBdaV2ng4slo9cb2y4Q0M82y9cdZWINcN2sBGOEhqAVsy+/MnV
         2OSE26jsqTgNZvTTT6guwlmEidwvcxrT/+mVYjx/mISmcVf/2i3OdEQ+OU5Oh11mQIMP
         AxK1ZEjereOmy6xzp8pYtqhsBbN2dqVSKamkRrIguA4JzeNHaPLFnKWTSfmm2ubYnP6L
         mwtw==
X-Gm-Message-State: AAQBX9ec2013ZvE7M/iz+Q2RO64GtQ7eFaXxDjPnEYrBlzup4I7vFAYE
        BJTYyOHRQWqg7g27us2ZfY5tpvk8dEsmQT9lvYOk0IsbprsuLCmalXiiALDN/EdhlX2WC5UUR8+
        FkjrKDG5OQb7CM9ITOuxJtYTeipxnQx+A
X-Received: by 2002:a05:622a:248:b0:3f0:a511:1762 with SMTP id c8-20020a05622a024800b003f0a5111762mr17625430qtx.18.1682528644141;
        Wed, 26 Apr 2023 10:04:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZLE/nVp2TA3qwzygSCg99BFI82BD+c8hqvOs8dmpb5gEYg2Oweq3Xuy0IjQrivk8QFpO8bmw==
X-Received: by 2002:a05:622a:248:b0:3f0:a511:1762 with SMTP id c8-20020a05622a024800b003f0a5111762mr17625385qtx.18.1682528643790;
        Wed, 26 Apr 2023 10:04:03 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-144.natpool.nyu.edu. [216.165.95.144])
        by smtp.gmail.com with ESMTPSA id v9-20020a05622a188900b003ef467f4fe1sm5466241qtc.88.2023.04.26.10.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Apr 2023 10:04:03 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     hdegoede@redhat.com
Cc:     Mario.Limonciello@amd.com, jes965@nyu.edu, jorge.lopez2@hp.com,
        kai.heng.feng@canonical.com, linux-kernel@vger.kernel.org,
        markgross@kernel.org, platform-driver-x86@vger.kernel.org,
        rishitbansal0@gmail.com
Subject: Re: [PATCH v2 1/2] platform/x86: hp-wmi: Add HP WMI camera switch
Date:   Wed, 26 Apr 2023 12:49:38 -0400
Message-Id: <20230426164936.8807-1-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <0b609a22-5da3-8305-ac93-caf1a0265170@redhat.com>
References: <0b609a22-5da3-8305-ac93-caf1a0265170@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mxfrLeZkAaOb8C7bAi00rWTD3Wj3XC0L
X-Proofpoint-GUID: mxfrLeZkAaOb8C7bAi00rWTD3Wj3XC0L
X-Orig-IP: 209.85.222.199
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=0 clxscore=1015
 malwarescore=0 bulkscore=0 mlxlogscore=539 adultscore=0 priorityscore=1501
 mlxscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304260151
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

On Wed, 26 Apr 2023 18:09:13 +0200, Hans de Goede <hdegoede@redhat.com> wrote
> I assume that event_data = 0xff happens when disabling the camera, so
> we report SW_CAMERA_LENS_COVER 1 when the camera is disabled, right ?

Correct, the 0xff event_data happens when the camera shutter is closed and
the 0xfe event happens when the camera shutter is opened.

Regards,
Jonathan
