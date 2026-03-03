Received: from hope.aquinas.su (hope.aquinas.su [82.148.24.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61EF32874E0
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 04:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.148.24.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772513248; cv=none; b=NTOYTl7XP0ShQn3KsbnFfOUG6L30TdBg/AMP8ZC1bCY0UM3exx2sbm5AdM+Ycl3ekpyD3iCiFT6QC3tXM/Fa9meC7p5EyK4/ghJFuJwgiHiqqjmlhkvNshTeoHJxsJ8P00wlwc9CfqmGD3nk3GdInnVtjXoxNTFoHFWTFZcibWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772513248; c=relaxed/simple;
	bh=ZbMDqQ7qEqrPK6+RYGLBGakPh7Yb4YpN10bpoAa2qio=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=f7ilEQ0/S4U+6nJ8sdcGaczga5E/QPszkXdHYZxLjT1j01qBQoBXDM9pUue2cGPdFA55HCxJTTrXDtqAaJqty07/UhSsRLHK0rx+qiRbucdZlZLIuCfnj1Q5gOthYl9Yx7jXayW1DQHFmkIqESRu9NwrUlD2pUCLkEwwazmXLsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aquinas.su; spf=pass smtp.mailfrom=aquinas.su; dkim=pass (2048-bit key) header.d=aquinas.su header.i=@aquinas.su header.b=s3csjCz8; arc=none smtp.client-ip=82.148.24.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aquinas.su
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aquinas.su
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=aquinas.su header.i=@aquinas.su header.b="s3csjCz8"
Received: from woolf.localdomain (unknown [158.46.243.40])
	(Authenticated sender: admin@aquinas.su)
	by hope.aquinas.su (Postfix) with ESMTPSA id 45FE56F91E
	for <platform-driver-x86@vger.kernel.org>; Tue,  3 Mar 2026 07:37:52 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aquinas.su; s=default;
	t=1772512672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1kiDvFFPCSaoX6MoKFlch15y8NYH2ipQKmfWibBeA+U=;
	b=s3csjCz8HrPkHgnkVgQ37OfQm16UYZEzjG9BjytZEKiB2LwrRFglmUtZztermc1BgHPgW6
	ts4tBThIcAniRjzg2o4podLSa7kMkwZkckzdnzimsceu/M2e/Tar3bkPc94ScCA441yNJp
	Qe2+05MfvfEZGnoTTihqV0rJr3ZUfvJUVaPPcUfRUcDGzi7tD6SQarulW4mCdaLUHXRm1D
	zjD0Y0IjEeHmAwDIsmgbRriITeMGwbJVh0JwJNQAMEZdzxvHJO8NwhRO/fhz1fCtuheUP9
	KsqxSl9WRRfwGHJszI7jZkxk6venENKXQP5jIyEx7c3XG/eHENvrhFC2qNdPng==
Authentication-Results: hope.aquinas.su;
	auth=pass smtp.auth=admin@aquinas.su smtp.mailfrom=admin@aquinas.su
From:
 =?UTF-8?B?0JrQvtC90LXQvdC60L4g0JDQvdC00YDQtdC5INCS0LjQutGC0L7RgNC+0LLQuNGH?=
 <admin@aquinas.su>
To: platform-driver-x86@vger.kernel.org
Subject: [PATCH] support for thermal profile Omen 16 laptops with board 8902
Date: Tue, 03 Mar 2026 11:37:51 +0700
Message-ID: <1948971.tdWV9SEqCh@woolf.localdomain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"


The HP Omen 16 with bioard ID 8902 has the same WMI interface as
other Victus S boards, but requires quirks for correctly switching
thermal profile.

Add the DMI board name to victus_s_thermal_profile_boards[] table and
map it to omen_v1_thermal_params.

Testing on HP Omen 16-c0004ur confirmed that platform profile is
registered successfully and fan RPMs are readable and controllable.


--- 
drivers/platform/x86/hp/hp-wmi.c | 4 ++++ 
1 file changed, 4 insertions(+) 

diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp/hp-
wmi.c 
index 304d9ac63c8a..f60a48b97c36 100644 
--- a/drivers/platform/x86/hp/hp-wmi.c 
+++ b/drivers/platform/x86/hp/hp-wmi.c 
@@ -189,6 +189,10 @@ static const struct dmi_system_id 
victus_s_thermal_profile_boards[] __initconst 
               .matches = { DMI_MATCH(DMI_BOARD_NAME, "8C78") }, 
               .driver_data = (void *)&omen_v1_thermal_params, 
       }, 
+       { 
+               .matches = { DMI_MATCH(DMI_BOARD_NAME, "8902") }, 
+               .driver_data = (void *)&omen_v1_thermal_params, 
+       }, 
       { 
               .matches = { DMI_MATCH(DMI_BOARD_NAME, "8C99") }, 
               .driver_data = (void *)&victus_s_thermal_params, 
--  
2.53.0




