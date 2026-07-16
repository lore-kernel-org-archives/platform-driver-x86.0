Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E78126B95B
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205121; cv=none; b=dnfHHbsORJmf5TrhOdg1kMEAYIFvDjJJ0R+XJo2XbaTxuicJA4wsNTiOLdEoxJqYF11ps6p+pPaOcuMaVJ6FRFnaVd5M1Ifc1UKQ5sR+Cw1BPo+nR3EtVRFgPZ0VSJq95n09iljPqZL0Y1+8lNqC60H7SeA1gQq5ZI0mmQ5XHgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205121; c=relaxed/simple;
	bh=l+GVxg7gIvyDgqoTTqrYYsU3vUaHictcdK7A6qwU6To=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K5I4a/JvUbL2CQCObd5iyHrPtMcNlw3tSRqikBoXrUjtffqy06ppeVhIZdTHxFATplkq9X2O+WKwb55eI2n3wg5Nx2IvHyy9DofsCY04NYGjvrIOXd1SYuqHE282fKIvK0zPGzFY5h1KKNnQHWnRDtYnlxpUTBXIMSd6BRKvVuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXYUz3Hy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YhInQaKc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXYUz3Hy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YhInQaKc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBipOi2355533
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s1CMIetpvxg7sHg7+DwO7k
	DIKRMvUV1yPmdATGl81Ro=; b=XXYUz3HypZzvBTZ8YanpWEC87C4h5dZs6tEGZX
	De71CpuMPS5un/U/tF1P/LBUy0YHsnhxxRVWC41L4xg3Kjvm7wRGmTKw807r+54z
	AL0DKLkfvKJvDhKYTCAwl91F+/r117QWwaKQRlseZPltJF+yfRb/khveypr4xIqB
	NkduXGrVVv1RTimKE9ay8uUVbAxoPSvrWUb2pbdAlxJT+l3hpcQ4j5hcJi8kA4qB
	+5FHNQwUAmSIKO1BeqNOxtB5a+2Xozw5l35kl002SWPfi0Fj5qMe68eqtkJ7Cl/N
	+yzOdDCBNRp9g3fYgmgxWaD7+AUGZTOi4aSEVai16CTvWOmA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fed064bps-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 12:31:59 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c19493ac2so114791551cf.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2026 05:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205118; x=1784809918; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s1CMIetpvxg7sHg7+DwO7kDIKRMvUV1yPmdATGl81Ro=;
        b=YhInQaKcV/wKLw99dB3MjuXt2XNa0Ffb2LH7a0cfYRCoPIhyprSpnGPZZsXGxh4s6A
         OGLvO78hFP5cacMaQEg4Ll29IHly/BHLSbKhvW+wCjO4SIUwwX8DlhHa2bf5viwpmXWI
         L1YW9HrajEx1wzxtxb5ZJRhqd/tjcOXI6S76ymW7pR688UFnrP1tBu2ZcD1/FRTRMthF
         o+GMMBtmt/jj7b0RPxaQpDRh9b3//hQze9OOfP0ajUI+AY366HF6/PZRV4t3iEd+wQMR
         SbfHrv4FiL4q3ybRBWLE6j6CeAIuHtMnFsQ9fXhGmFtq+ZulxHeMnD6QtJYU0q5zywCk
         yMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205118; x=1784809918;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=s1CMIetpvxg7sHg7+DwO7kDIKRMvUV1yPmdATGl81Ro=;
        b=QIzq64OQgzYGgqoOPBcNIwNK+ounLLZy64spsrH0qRsn5pbCvkiCQv42wOhUTkTy8J
         Hfw14XLYHP8Hc9z9wGu671BA/hESL70brLb+Udk1t7vkzr8XVBg6gvyjsOAchdZB7V4f
         XJKxrNrn5slJpXFTyGZKpSFKtEef8acLXFddw+InnNoGhsXa2oMFAtI0Zht4HEhlNr+O
         iFIiH/0Ta6gE4mgl9TT7gdIHaDZKHyvCcEFJmsSFOtaxlMj91KCVQBRmG/QbzHrgwdHP
         1bvslJ+NcBbbQ0oV5Mon5+LW3/CuldMLJDMRBnU7nrue5bO+ZFeio4ck8pX1MAXsEnGq
         TcLg==
X-Forwarded-Encrypted: i=1; AHgh+RoWlJtwMFCKjsUd9atW4vLKAw7gdvnTSvCosO9EBkdaZHoJPCqs0btOx7+Rdub7eHdmwTaawNAu+4RApPf7nbgMPQCg@vger.kernel.org
X-Gm-Message-State: AOJu0YyFr2ojG+Z0N3dhEhKG/pQ7oLMI1cvpY1lFkweWHDqwKxNK38Ea
	8JKyNP9/+U/KUgOspKdcHEMa7dxZ80qsSal0nhoB6tiV2dLWqeP0lji/a+E+GPylUcLtGHdmtSC
	ZMpNHzUIiRUhJhrSdKR7iB4jkoyJ7kFvlWL6Dxasa8BoxnYf/dsCGqgTjNLeEgnrDpDKgaEky+0
	YP
X-Gm-Gg: AfdE7cnS0njOsvWSQad/KirMEO53XHBGjjxMS77fclyWfVVdHkL2e7Q7aoJ/MUsF69Y
	oeHoOBITl2uMBqwejdWAfCXyw0D6LTPNkItWrkbYdM45zGnlwHKTd0LP+EuLGuMkSFjP9MpSotS
	ltWYMpbGIrCjVj2fWI5b6VrcWLkJtX1A1cDWKAb8NmDcqXA2Arg367anCpNsbsKnlHTuVoEr9y6
	PsYuSn9u6dwXWuEfLtGAzrUXO7nSZB4zL1gEJR5cREk0yh5thChJQ4+amJK93NxrQXSDbAW6+r9
	LmjE+g4LRBkiwQHoOfWYoGJRYNCCB1JcsSEms7bBhMM3Zm+4KXxqZ3TRdz0oWjPRasj477Jmbj3
	zLFfDF0wMTH/zh1kFKVA3xMgqDn4=
X-Received: by 2002:a05:622a:391:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51e42481546mr107232981cf.42.1784205118221;
        Thu, 16 Jul 2026 05:31:58 -0700 (PDT)
X-Received: by 2002:a05:622a:391:b0:51b:8539:e8f7 with SMTP id d75a77b69052e-51e42481546mr107232321cf.42.1784205117470;
        Thu, 16 Jul 2026 05:31:57 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:31:56 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 0/5] driver core: unify the release path for dynamically
 allocated platform devices
Date: Thu, 16 Jul 2026 14:31:35 +0200
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACjPWGoC/43SwW6DMAwG4FepOC9VYicEetp7TDtA7LRoA1rS0
 k1V332haCpSC9slknP4/MfxJQncVRySzeqSdNxXoWqbWGQvq8TtimbLoqJYJyAhlVpJEc5NSyw
 6rtueRdsI4l6cmo63QkPpnS4ByyJLIrDv2FdfN/ztPda7Khzb7vvWq1fD7b/YXgkpHFlCaTxSC
 a9tCOvDqfh0bV2v45EMeg8TEXBRhChKNqDQEQPTjIhTMVsUMYoGsSRnVQnAM6KeiLj8aj1kVMZ
 qKmTBhDOiuYtGwaJoBlGiYe9TzNTcHNOpuDzHNIo+dybLMScPdka0d9H+IdooppSWTutMgy2ei
 NdxtTo+nOK6Hsf9SmoOobit62Y1dpKp2A+y/23nx29S3kvIGNHa/JGP+CN1D+3PQ9rPqvkYf4i
 0B2KOSSl/lvX6AyFErmBiAwAA
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6013;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l+GVxg7gIvyDgqoTTqrYYsU3vUaHictcdK7A6qwU6To=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM8xfbCcGlSij+W3IlrV5rWQafhRbpnujKIzJ
 VeZ6DLcidCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPMQAKCRAFnS7L/zaE
 w2/yD/wMHKEOz8hsz5FFtrYv0HvjuwIwK9z3HNr0C8UKT6AmOsLVTOMFbe7bxaF8O4G3l+ABDN+
 ayxM5kYybIr/sSQYApVJ85K5e7xDYGRNA6fivmv2+2V2NE8yNUHfGfJm8RoVB2Udo/4eN/CP366
 QsAQPvXJ76m7iKbcg+vRZ7WSYfglgnm2D8zJtUfBx88NTeaY6TAGhy/NwvQwicN3vTCleNlY3pO
 I2tBg8rTX5AgfPc4qf/dSotMqW2uC9IjmO5/YQg8wEPToR/W92hpnlX7+VYe/rikLhz08baG7Ai
 raYYgBcqog8TXce9vdcdkQt0JEEVOefJty07dkpKZVApv+yVCDQSo5n4cqbO1R68aMpefIk0Vhf
 cF+v0ELnGNntMIMG4W63XWc1I90+NmfoMSkN8AedLOh7AMUSkHnVxMR6kUgpwmEUqd1a51nMQ2x
 RyLOlR27Omy88KtWA3l7SjpTXJioi/NCjXRez/ivsawosJe3o7y/v30Y2QuVopjuFo7/PJ5Zx/m
 tVP1Gvmh7ANnKDx6uckSKO8wdUoahbtrb92OvwNed+V5oZM4VUmJ+aC2ckXPLJHnPguY0e/o94f
 d6SC3//0KWxWKVvX6R0OHI0Mtq8KnGmi7SIw0Y2VbTXBKNVpVsFCWTUHStstuTCJuSxi4YQqAI/
 XsyhjPlkV23FReQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfXzohyYTYCeUlr
 syru0w3zRSBa9FaapQCYEWOkWq3asVshId+i5Nrz5h8bSoPb4aE1v/hpQ//WuRfhmKvo4XsiOkV
 a+JWxYytCfwjCa2ryZe0GaqhBnV6DH4=
X-Proofpoint-GUID: IYVa6voy5A-w-795ZZc34ZSx8-E6i6AP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX/sg4Xtc2OR9E
 +kxwBql6ctZi8927Go64oCUOkTSjLOWY4hhS8XlzUilqBdQRsoll1+oLj2uSY2YORFVibLjKqJ8
 XiiAYul4v8WLvDLKSPE1RlnXcTkpjFv4Mhm57/nBXS7KXD/4S41YilJSShDthTjYNYXVd2Kv4Yz
 12ldlL/kJHK9HJ6tIC+05EjCgwQmDZxVcaEpaVG4ziHiKAU0LcRd+PMA5oeCLmilvEu+WB9tjvL
 9Gkw7ueQCdN/hpnzN/hDPSgSK/Vk2E6wHgmeJB/o77QLN/L4xGm0I1pzd5PI+VFiEnY2z4L81mW
 uk3ulnByXp2ne0jvwgh+VquyLroA1yngnCIVhBrAhUiogFeE10sRg0mDjg9SnM2K21AxecrHEPm
 3Bc7HkdEcjxZsnlFRkG09ndoooVHm96f3CfsWPSzUVKNnTsD34pZxzRHpBrdTSgj/8q4iL8rE3h
 aOUWgpHbDvYXPhdfcCg==
X-Authority-Analysis: v=2.4 cv=Xb25Co55 c=1 sm=1 tr=0 ts=6a58cf3f cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=fY9noNvUkyJ7C7eDhOYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: IYVa6voy5A-w-795ZZc34ZSx8-E6i6AP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

This is a follow-up to the fix in platform device code that introduced
platform_device_release_full(). With the two prerequisite patch series
applied and with the two last remaining offenders converted, we can
finally unify the release path for platform devices using
platform_device_register_full() as well as those using the split
approach of platform_device_alloc() + platform_device_add().

With an ack from DRM and platform maintainers, this can go through the
driver core tree.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v8:
- Move the special reference handling of primary software nodes to
  platform_device_release()
- Make the API contract for platform device fwnode setters stricter and
  don't allow to call them for devices whose primary firmware node is a
  software node
- Link to v7: https://patch.msgid.link/20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com

Changes in v7:
- Drop patch 1/6 as it's already upstream
- Drop patch 5/6 as its been replaced by another changeset sent upstream
- Lock device when calling device_is_bound() in kunit tests
- Fix invalid reference put of the firmware node in surface_gpe
- Rebase on top of recent driver core changes
- Link to v6: https://patch.msgid.link/20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com

Changes in v6:
- Make patch 1 a minimal fix that can go into v7.1
- Don't provide platform_device_add_software_node(), instead: rework
  drivers in question to use other existing interfaces instead
- Fix life-time issues in the xe_i2c patch and remove unneeded fwnode
  removal
- Fix typos and tweak commit messages
- Link to v5: https://patch.msgid.link/20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com

Changes in v5:
- Provide a helper for users of platform_device_alloc() that wish to
  assign a software node to a platform device
- Rework drivers that could regress after the swnode leak fix
- Split the series into several patches as necessary
- Link to v4: https://patch.msgid.link/20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com

Changes in v4:
- Drop redundant !pdevinfo->swnode check in
  platform_device_register_full()
- Handle all three combinations with which two software nodes can be
  assigned to a platform device
- Extend the new kunit test to verify all three combinations
- Link to v3: https://patch.msgid.link/20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com

Changes in v3:
- Make sure the reference of the primary software node we possibly take,
  is always released by moving the get() before calls that may fail
- Don't allow passing two software nodes
- Add a test case for that situation
- Link to v2: https://patch.msgid.link/20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com

Changes in v2:
- Change the order between removing the software node and dropping the
  reference to the device's OF node
- Address a situation where a software node is used as the primary
  firmware node
- Add a patch adding a new kunit helper
- Add another test case
- Link to v1: https://patch.msgid.link/20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com

---
Bartosz Golaszewski (5):
      driver core: platform: amend the API contract for fwnode setters
      platform/surface: gpe: use platform_device_register_full()
      drm/xe/i2c: use device_create_managed_software_node()
      driver core: platform: unify release path
      driver core: platform: tests: add test cases for correct swnode removal

 drivers/base/platform.c                  |  37 ++++---
 drivers/base/test/platform-device-test.c | 180 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_i2c.c              |  22 ++--
 drivers/gpu/drm/xe/xe_i2c.h              |   1 -
 drivers/platform/surface/surface_gpe.c   |  39 ++-----
 5 files changed, 224 insertions(+), 55 deletions(-)
---
base-commit: 0de8455a9de5713f4022b20d655f18edcd3cf468
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
prerequisite-message-id: 20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com
prerequisite-patch-id: 76dea1205a0905915a03c0d7c9e94399c92501e5
prerequisite-patch-id: f6c074c48e5eb2f5e92c57fa1320b6b0fab3ce1d
prerequisite-patch-id: 07a0c422cc3233e2fe87cb9bbd6baab608d0de82
prerequisite-patch-id: 5e980cccbfdc82adef1573f8a8a9639689836432
prerequisite-patch-id: bb193e0baf41714061b83b3925cc4e28036f2b9c
prerequisite-patch-id: 5ff0ac2c7c4cc548692ed5f567db30e27e920786
prerequisite-patch-id: deb425beb85441169aad53c1282f35df513b8015
prerequisite-patch-id: b0e9e719c8daf30d97c110478a5c3c7af106472c
prerequisite-patch-id: 9f118a7cdb92893ed4e913c7c98bbdb766ff18c4
prerequisite-patch-id: 1b2391d8295e80086182f55e5189b9aa588687f8
prerequisite-patch-id: 986a0f4f9a682a255f6eef0fe2128a86c595ece5
prerequisite-patch-id: aae63ceb82cbe6f65810751e596e542df0ff513b
prerequisite-patch-id: 155601719d4f5c433fd7dce63842007f255bec81
prerequisite-patch-id: f9bebca5cd8f5ebf9b52e9c688a3c83ddc7efb7f
prerequisite-patch-id: aff2299bcf258e4e6dd1f01c591141385f31fdff
prerequisite-patch-id: 51cfbca3ab011688be133a259d598007289237c4
prerequisite-patch-id: 0e9bddaa83a1f5a99745c2f50f7c3213d7b17fbd
prerequisite-patch-id: 7ca12b7bbf0168eadaece00587dad68e1ff3cbec
prerequisite-patch-id: 8d483c4b391ed1b95897c951555e7ab6c5807e2a
prerequisite-patch-id: 495173352a585bdfd0c58721c8be0558d06a5335
prerequisite-message-id: 20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com
prerequisite-patch-id: d7f936bb1eb8e9fdc0a6a35770e376d36a0b595e
prerequisite-patch-id: 77b6a4eb67cd6bcb6fbc974a4d0368be6a2810ef
prerequisite-patch-id: 744bdc8ea502dab2db13b1cbe963c1db49c951f0
prerequisite-patch-id: 185deea7fe874a7d4a70c93e0b60cc3bbc75ec25
prerequisite-patch-id: d9e41fb8f4070e53ac293db82ccbad83c8d2a40b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

