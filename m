Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61994C77B7C
	for <platform-driver-x86@archiver.kernel.org>; Tue, 25 Apr 2023 21:43:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232154AbjDYVnV (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Tue, 25 Apr 2023 17:43:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231629AbjDYVnU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 25 Apr 2023 17:43:20 -0400
X-Greylist: delayed 1990 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 25 Apr 2023 14:43:19 PDT
Received: from mx0b-00256a01.pphosted.com (mx0a-00256a01.pphosted.com [148.163.150.240])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 224BCB239
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 14:43:19 -0700 (PDT)
Received: from pps.filterd (m0142701.ppops.net [127.0.0.1])
        by mx0b-00256a01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33PKfoR7011695
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 17:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nyu.edu; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=20180315;
 bh=HKURM7lQwvlytFLh5YItjG4WpOjT7MPq3+fMeQnQZXU=;
 b=Q0+DTDrSpss/DG8Ckj0tfoNanZ2FghIYMzB1+ROTlVeANZgFMnRQi6GKHqKtatrly87L
 cNSP1vZUQi2tWZQ+gkfzgIp4rlgpk7CavDmOizj0EjQuAkT+bN+kIsi9yphkxV8iC34F
 GTPDn0LPWFG1yVaUECZ6nBNeBMx54HjcbM9z84nuwUsKaYL9fQNVCc+hycSgrueYY07R
 ptFb0Qi7J0CF/hbHvJ/l1QPNtD2omu6aW9KnuyeI7wCDgSnofKYdx897lCo55Mr5i7Ip
 YXrAoiZwjM3g9tlAk132Ui54OLHpU/rchNo1C4lMSTe2KtMpQyrwVncrpQeJCBmXbDJ4 1g== 
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
        by mx0b-00256a01.pphosted.com (PPS) with ESMTPS id 3q5vhc8j32-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 17:10:09 -0400
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-5ef7c6b44b0so39152586d6.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Apr 2023 14:10:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682457008; x=1685049008;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKURM7lQwvlytFLh5YItjG4WpOjT7MPq3+fMeQnQZXU=;
        b=TXPLAhpafLaN1Mn6TU/FLePikt8YzVMKDnnSsWg8U8a3XvBx6+GqbTw1FuF+Y0Ekrl
         Fhk/TxB71JbbvO62hqDpDEQdi7/bkL1KLUbA0uesYe9IcLcTjWuF0wkGFSBl1uHoiCpH
         KMgKR26mEPS0f6QmqXCGd6ceKEzkQaZbv0/wDKSkIMS7wVFUzX+pk8EzyDGnJ7G93/Rb
         hQi9V6xoOcKkBmWUqPBjiDIrcyhzsGEdKSYS5EtwmLU/oCDOx3Mj7H+bTb/ZL7gm0uT0
         C0OSUgJedlL+KXSIzpn07OMwsEawOqRaZGBVuU24qmC2gBQzJNQJHLGl83VX8aAGVoIz
         Osqw==
X-Gm-Message-State: AAQBX9eUMxGl3e2oWnA5F7JgTGw5/aLvxeIVNzi+D329SOyQIMd+TZ39
        henBltbC7knD6KPM8LpsmOS93fYtleLNuXkyu/UamQVPMj/KIbIuDS+dTsYWJwInSeCrCWshw3j
        98O1juwMN/B+GLrYjCwonRt5o5Memvh0lzDmNkNl9zjo=
X-Received: by 2002:a05:6214:501c:b0:56e:a9c6:d2c6 with SMTP id jo28-20020a056214501c00b0056ea9c6d2c6mr34737614qvb.6.1682457008172;
        Tue, 25 Apr 2023 14:10:08 -0700 (PDT)
X-Google-Smtp-Source: AKy350b8H6oImKBsfMaSxwrjO9SgDN2vDovPneV/eC15FQgUsEGJOE/Q4cqdZT8/846IvUJYy9B0VA==
X-Received: by 2002:a05:6214:501c:b0:56e:a9c6:d2c6 with SMTP id jo28-20020a056214501c00b0056ea9c6d2c6mr34737591qvb.6.1682457007932;
        Tue, 25 Apr 2023 14:10:07 -0700 (PDT)
Received: from enviable.nyu.edu (216-165-95-139.natpool.nyu.edu. [216.165.95.139])
        by smtp.gmail.com with ESMTPSA id n16-20020a0cdc90000000b005ef589381a8sm4341426qvk.52.2023.04.25.14.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 14:10:07 -0700 (PDT)
From:   Jonathan Singer <jes965@nyu.edu>
To:     platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Jonathan Singer <jes965@nyu.edu>
Subject: Re: Function of the camera key on windows
Date:   Tue, 25 Apr 2023 17:09:53 -0400
Message-Id: <20230425210953.14597-1-jes965@nyu.edu>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <MN0PR12MB6101D9688E7904FF52634520E2649@MN0PR12MB6101.namprd12.prod.outlook.com>
References: <MN0PR12MB6101D9688E7904FF52634520E2649@MN0PR12MB6101.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 1ANODNEEQW2y2BOoE93u582igmmT5VAt
X-Proofpoint-GUID: 1ANODNEEQW2y2BOoE93u582igmmT5VAt
X-Orig-IP: 209.85.219.71
X-Proofpoint-Spam-Details: rule=outbound_bp_notspam policy=outbound_bp score=2 clxscore=1015
 phishscore=0 adultscore=0 spamscore=2 mlxlogscore=177 priorityscore=1501
 impostorscore=0 suspectscore=0 malwarescore=0 mlxscore=2 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304250188
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The key itself triggers a hardware response both on windows and linux.
It disconnects power from the camera USB module and raises a cover in front
of the camera aperature. The keycode is as far as I know only to notify the
operating system in case it wanted to show a message.

Is that the kind of use case that would benefit from emitting a KEY_CAMERA?
