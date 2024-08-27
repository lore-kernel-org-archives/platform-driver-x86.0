Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C502114
	for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 08:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724748361; cv=none; b=MhJKiPUdYbI+rvGSU3zqjwher1wUykWyPS1Ay/DzzepRHCV3dZrdf6qlvJUxW7ohRVreYJuQBu+9d2l6ap8TDK/yYbBUhwMKHsZda32qF9qiLZPZBns0HQBrPKmk/IMvn2JKRdZu7fHQo2RzIxHSPJbHfB0thefl4eqGNx+ngLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724748361; c=relaxed/simple;
	bh=0sOMbk+VclDZsgdJHMlbirNAvaC3nhWN08swyQa/soI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OU3ch827f6XoTCHWWH0pe7rfrxNPhaStabNXmbFLog5Cr2Kv+A0lcXz22oZsKz8kD++1G5uet5cI4roH+gecILH86ixHw4hn+SL5aW/W6oWDFmz9keZeXws7tHEj2JNZ5TXLk+Lfwe7gABqrCkgJ3bvoM88nw86VMVbaM0c1Ekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k+QKOCdT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k+QKOCdT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-428fb103724so32843935e9.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Aug 2024 01:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724748358; x=1725353158; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3okYOah5h7LF8oC7YTqtd5faAiFr4YTZDUyz8E01y/g=;
        b=k+QKOCdTsPI9/OADMNv1YivaOudiJuzosXywxPdCZ9vRunosW21Kf6ErsZRT0OlG1s
         qyR5OFAKvZNLCPNPZ8uOQKagpgzpyZNbZWmYoDFQSxkHrHCCQX+xwhwNrhr/dGASrU57
         Ssq489lryAS32QVVRvOeWcdBPwe7KvjjNGflabcoZBMIGUZtelt0JiivNHznO3tuS9qP
         pYBuZZOaY26tYuIlNSVWP8TQbQg9qWiTnyReYDeaRgL7xdrU5Pb/uVfQrauAb1p/gTgf
         3QqsDAy1GUv+Wq3RUZv2sc3Ni7VPnYhduXDQDO5u/tb12RhCnQeUilImzLEk7SGCD+p4
         DLiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724748358; x=1725353158;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3okYOah5h7LF8oC7YTqtd5faAiFr4YTZDUyz8E01y/g=;
        b=NSkyKOIExH6Y5pQ6b7s9gsPKSVIoURy/DGoi99N+WFtzp7rwfO3LGA/MQzio2D+0Py
         QTxIrxQCEh7W5pf079Ar5gDhmfbCvbjvjE1JaPiKAsFfli99fBQ5yK9MDvS8RxHUh6Hl
         eje0onG0XX0n82XuJPIZ+qS4TXXJ0O72nVxSjnARmpPyLiOP87q3YUx/nAy8jBxw3xpF
         FbcdoIp2oiwdyAwWOy/RQVV4r9H8wkycKPN06xWMKhDvrL7ftOGNUoo3O0FUd2C2kfuw
         NMer8cgqXOXfLjhArOC+v/JpKKCRGmqEPlHo0McN3BkqygZ4mFc+zLLAJNPPNQ47Q7n4
         cs9w==
X-Forwarded-Encrypted: i=1; AJvYcCWzdgaPbbDf5MuguB13SZnfacQ+Aq4qB5nsqbJqzbmyJ/ChxB9p2Pm2mX02qP7Aj74sKG7B+kMsCB3z4tzFqN15z2Jb@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/XmIjBVHE8W3PxChFtx4P/E3paG7Y0sIR1sEDObX9qeYicdr
	4jTeOy/pS619m6qStmH8NFi+b5SauznEKWUZFo6IRLkDrdrIJ9SQrEMeTK1Dhqwe1jWGqAVPMsi
	L
X-Google-Smtp-Source: AGHT+IEptX/IcZFMcpwFoTmEY5uvRGOZCCuBBE4qEFoD5y4B9BtepyWTi8cwqrBErcgvZtpPMKylsg==
X-Received: by 2002:a05:600c:1c1e:b0:428:f0fc:4e54 with SMTP id 5b1f17b1804b1-42b9a681fbamr12574795e9.11.1724748358297;
        Tue, 27 Aug 2024 01:45:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42ac514e04dsm178745925e9.6.2024.08.27.01.45.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 01:45:58 -0700 (PDT)
Date: Tue, 27 Aug 2024 11:45:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Matthias Fetzer <kontakt@matthias-fetzer.de>
Cc: ibm-acpi-devel@lists.sourceforge.net,
	platform-driver-x86@vger.kernel.org
Subject: [bug report] platform/x86: thinkpad_acpi: Add Thinkpad Edge E531 fan
 support
Message-ID: <f99e558d-c62a-41eb-93b3-cf00c016d907@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Matthias Fetzer,

Commit 57d0557dfa49 ("platform/x86: thinkpad_acpi: Add Thinkpad Edge
E531 fan support") from Aug 16, 2024 (linux-next), leads to the
following Smatch static checker warning:

	drivers/platform/x86/thinkpad_acpi.c:8387 fan_set_enable()
	error: uninitialized symbol 's'.

drivers/platform/x86/thinkpad_acpi.c
    8319 static int fan_set_enable(void)
    8320 {
    8321         u8 s;
    8322         int rc;
    8323 
    8324         if (!fan_control_allowed)
    8325                 return -EPERM;
    8326 
    8327         if (mutex_lock_killable(&fan_mutex))
    8328                 return -ERESTARTSYS;
    8329 
    8330         switch (fan_control_access_mode) {
    8331         case TPACPI_FAN_WR_ACPI_FANS:
    8332         case TPACPI_FAN_WR_TPEC:
    8333                 rc = fan_get_status(&s);
    8334                 if (rc)
    8335                         break;
    8336 
    8337                 /* Don't go out of emergency fan mode */
    8338                 if (s != 7) {
    8339                         s &= 0x07;
    8340                         s |= TP_EC_FAN_AUTO | 4; /* min fan speed 4 */
    8341                 }
    8342 
    8343                 if (!acpi_ec_write(fan_status_offset, s))
    8344                         rc = -EIO;
    8345                 else {
    8346                         tp_features.fan_ctrl_status_undef = 0;
    8347                         rc = 0;
    8348                 }
    8349                 break;
    8350 
    8351         case TPACPI_FAN_WR_ACPI_SFAN:
    8352                 rc = fan_get_status(&s);
    8353                 if (rc)
    8354                         break;
    8355 
    8356                 s &= 0x07;
    8357 
    8358                 /* Set fan to at least level 4 */
    8359                 s |= 4;
    8360 
    8361                 if (!acpi_evalf(sfan_handle, NULL, NULL, "vd", s))
    8362                         rc = -EIO;
    8363                 else
    8364                         rc = 0;
    8365                 break;
    8366 
    8367         case TPACPI_FAN_WR_ACPI_FANW:
    8368                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8106, 0x05)) {
    8369                         rc = -EIO;
    8370                         break;
    8371                 }
    8372                 if (!acpi_evalf(fanw_handle, NULL, NULL, "vdd", 0x8100, 0x00)) {
    8373                         rc = -EIO;
    8374                         break;
    8375                 }
    8376 
    8377                 rc = 0;

s isn't set on this path

    8378                 break;
    8379 
    8380         default:
    8381                 rc = -ENXIO;
    8382         }
    8383 
    8384         mutex_unlock(&fan_mutex);
    8385 
    8386         if (!rc)
--> 8387                 vdbg_printk(TPACPI_DBG_FAN,
    8388                         "fan control: set fan control register to 0x%02x\n",
    8389                         s);
                                 ^
Here

    8390         return rc;
    8391 }

regards,
dan carpenter
