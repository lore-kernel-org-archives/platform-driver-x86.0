Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8746F221272
	for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 10:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744800350; cv=none; b=KLDKvMIPpZaN6NhTXm7u3wmUr7fyOTBTY+ZWxRczs/gsrTFLYvPbr7Icr5qLjM0WXgKJ1aP2Kv7hByQ6+c2/oS9RNGmDQzG+lXGZlCFf8B4qQ5QfgpLfn1hPqzLowBSpB+p8/u2IMjQpB5fhVq+Ff6YW3QmCIwhSBDFIlAzSXjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744800350; c=relaxed/simple;
	bh=8XwdEKXPWqKP46q2DAvF1hQQUAIkkLiXVtLjRKgLpPs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O60ZNSoRcOCvvTrLHlHm6I+h0wW5ese/yumnYvPcgiEsoUsUnCDn/iYZQpfU4tnxrr0TKAFpGunjh3cQxGrWVMYhzwv42vq9zpICPYCWtwn5yx7W5FyAGVwJ45CA0occ+0rK+wbqhhh+ERkhkPTX7T3CD7e7h33lAEsTMhtJ4fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LdQxMVAH; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LdQxMVAH"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so45042525e9.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Apr 2025 03:45:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744800347; x=1745405147; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5WDzGtDJwSP3t0KACOhw/5baBRxR5NcQ2thE8Do+EDU=;
        b=LdQxMVAH5Q2gf9kV5msdndSjGbDQv3WFU+qdEM1sF4/Q9exhDAfib2Y56wuNaaaEdh
         N28VLfhSagJi/0fOMxLyF91hta2NHRFZnsC2mJ/L+v7rI5BjQ51qy6dAwJLQpXe0woQp
         9oymYoi/RKu3fKrxGXeSoX36983o6YeJqwevCmxjLxVrr9Ve+b6loHQ6ThzT8u9b2Pzh
         UQh6QLHcXtbL9g9ZgqHJDBz3TBF3D5CyHwF0/pWWrXP3zI4r2rOlew3wfLfkzTFtyXce
         FWh+pt0MTzD6PrbgaKPrERgbRJ4u7aJuKv1wsaNBjc8h4RWaeislVJi9ZxBJhrRX0j/r
         n1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744800347; x=1745405147;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5WDzGtDJwSP3t0KACOhw/5baBRxR5NcQ2thE8Do+EDU=;
        b=YpgcGempBcw4w+i3BoPDhvWQWpvFAHAXueSDfSEbddotcKXC3181s/u/vt9J8L360Z
         /t4+L5lVw8NCnEkj6yFsiIw17S8VLxUMAO7UvcsXfE+grJpNelc1av5p404M5TVQgCYH
         6wPnEUvBhST6/Hw8TzAsz/C4PTCmhlM8Nbx3Uzb9Z88QirP7tjUC9cr7mCrd6XkOzaNJ
         sTt0h6nA5zWLZ6Hos0OgwhG745vzmKGJ5sI4/29CTVnb6hKtmGCgwVbNIUW/O/kVp0yN
         YoLh/e4ojbdR1Kn4m4f5ttItaGH7CgfMhmX1+vxulIkK0m9Ak2L//u77eZJxfzisQ5Vi
         sYhg==
X-Gm-Message-State: AOJu0YwrLYZV+ZDx10qaOyz73B2mc4c4BkSoWUrUkIuG9M+K/mug6LQr
	79sPaHJNo6Z12RSbXsut4LszbwcBj2v+lfMcFvHnKevWIOTpOH68TC4Pg5y1jyZeK2fY/Ewi5VT
	i
X-Gm-Gg: ASbGncsU4wDLGCrm+Jngk120Bh/lXSzY7NcaVtY/5c94dMaTY4WL1WsqndOCj9bDInf
	h0D7S3PPrQWtnIgmaGRJ85qzQ9uSOstcaf/W4/EBrqMIB5En6Y3ihnmeW9MXD9ZYjdGPZONnPHM
	T/72WElJs2arschAf48xR/S8xXxUiX3oRTVhLWmqrOeIgpk8US41/P64DwyDA6tBsIwp5lVnv4/
	nnOrNrDs0sADp745S/+N0eCMiEhZNRx+hI23kgQt2Ck89s7iUUwLq/QzaGQt/ffKuWMiJtprpaD
	hbKhEzVHV5rSfor6juE9rKN6b6nBKs5z8mRtKx+jwrz29Q==
X-Google-Smtp-Source: AGHT+IGJKddo+ropzaKCIpKUwpnmCj2AMwIA7/MqamHQWASFHDKzBxUoz3pCfSH3NFGtj6Uba7uasQ==
X-Received: by 2002:a05:600c:a378:b0:43c:ea1a:720a with SMTP id 5b1f17b1804b1-4405d5fcd39mr13473115e9.1.1744800346810;
        Wed, 16 Apr 2025 03:45:46 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4405b53f29fsm17100525e9.37.2025.04.16.03.45.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 03:45:46 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:45:42 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com
Subject: [bug report] platform/x86: alienware-wmi-wmax: Improve platform
 profile probe
Message-ID: <Z_-KVqNbD9ygvE2X@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Kurt Borja,

Commit 32b6372ddd43 ("platform/x86: alienware-wmi-wmax: Improve
platform profile probe") from Mar 29, 2025 (linux-next), leads to the
following Smatch static checker warning:

	drivers/platform/x86/dell/alienware-wmi-wmax.c:1217 awcc_platform_profile_probe()
	error: uninitialized symbol 'id'.

drivers/platform/x86/dell/alienware-wmi-wmax.c
    1191 static int awcc_platform_profile_probe(void *drvdata, unsigned long *choices)
    1192 {
    1193         enum platform_profile_option profile;
    1194         struct awcc_priv *priv = drvdata;
    1195         enum awcc_thermal_profile mode;
    1196         u8 id, offset = 0;
    1197         int ret;
    1198 
    1199         /*
    1200          * Thermal profile IDs are listed last at offset
    1201          *        fan_count + temp_count + unknown_count
    1202          */
    1203         for (unsigned int i = 0; i < ARRAY_SIZE(priv->res_count) - 1; i++)
    1204                 offset += priv->res_count[i];
    1205 
    1206         for (unsigned int i = 0; i < priv->profile_count; i++) {
    1207                 ret = awcc_op_get_resource_id(priv->wdev, i + offset, &id);
    1208                 if (ret == -EIO)

-ENOMSG is not handled.

    1209                         return ret;
    1210                 /*
    1211                  * Some devices report an incorrect number of thermal profiles
    1212                  * so the resource ID list may end prematurely
    1213                  */
    1214                 if (ret == -EBADRQC)
    1215                         break;
    1216 
--> 1217                 if (!is_awcc_thermal_profile_id(id)) {
    1218                         dev_dbg(&priv->wdev->dev, "Unmapped thermal profile ID 0x%02x\n", id);
    1219                         continue;
    1220                 }
    1221 
    1222                 mode = FIELD_GET(AWCC_THERMAL_MODE_MASK, id);
    1223                 profile = awcc_mode_to_platform_profile[mode];
    1224                 priv->supported_profiles[profile] = id;
    1225 
    1226                 __set_bit(profile, choices);
    1227         }
    1228 
    1229         if (bitmap_empty(choices, PLATFORM_PROFILE_LAST))
    1230                 return -ENODEV;
    1231 
    1232         if (awcc->gmode) {
    1233                 priv->supported_profiles[PLATFORM_PROFILE_PERFORMANCE] =
    1234                         AWCC_SPECIAL_PROFILE_GMODE;
    1235 
    1236                 __set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
    1237         }
    1238 
    1239         /* Every model supports the "custom" profile */
    1240         priv->supported_profiles[PLATFORM_PROFILE_CUSTOM] =
    1241                 AWCC_SPECIAL_PROFILE_CUSTOM;
    1242 
    1243         __set_bit(PLATFORM_PROFILE_CUSTOM, choices);
    1244 
    1245         return 0;
    1246 }

regards,
dan carpenter
