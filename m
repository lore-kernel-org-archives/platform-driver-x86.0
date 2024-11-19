Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 237A51D0E35
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Nov 2024 16:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732034610; cv=none; b=W7lMgpAi1KhNNEypNNIxSRi5ZqlHK5fRPjv6d+CXKsE2LLTz+3Ac1gMaeAlyUp5VDTGiNRv3lkZP/cV5dlZ2Jr/CkwjPJ0rj9ZO0Br5IPVWbLfB1UpzWK5UeIaoWzwCCfbxAbtYxPKlJdJ/+bp8kS5oVCchrCOL5E25gHO9DLUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732034610; c=relaxed/simple;
	bh=xKNLgVjMkRQxYEYWv7mTpulBHRk/E77m9A6EuDxmE/0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=beVviDzd7dNvUcKgRzF7G+WoyCpcUxGFv112v58Zp2nD0LAtgF04Y1BtMIjl5gWtGHoheHixrSe7NClqkucndMWjAh7WSI4E4vumdQJUx9vLmdFndPPjwrZX17yDjDB9W0GXaM+PyRtezyTypry+MSBt8iBQgy75KBd7Lw1aORs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=Q6dqzidV; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="Q6dqzidV"
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id E8AC02FC004D
	for <platform-driver-x86@vger.kernel.org>; Tue, 19 Nov 2024 17:43:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1732034598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ND6QtCrt9UtNrP0iWZN/lQ0/2956jlbKxuX7qUMIQMY=;
	b=Q6dqzidVF3hKJHbsoXVvxUqK69uopCE4B8Z6ZzmNWV7GfldlWaj4YQUfgxlIReBkExFDDG
	Jhm6lV+bzTaosLKQmFPjdDhruAoKklCWq6ZNYXd4WTUGOprtZoHF53PJlbLq/AsieryKJX
	uSi7lZXpmNMxU+yupzIhQEtoIkRsF7M=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <64d96f64-4512-44f6-be3a-ba07043485b6@tuxedocomputers.com>
Date: Tue, 19 Nov 2024 17:43:17 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: platform-driver-x86@vger.kernel.org
From: Werner Sembach <wse@tuxedocomputers.com>
Subject: acpi_device->driver_data vs acpi_device->dev.driver_data
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

another quick learning question: Why does the acpi_device struct have a 
driver_data member in addition to the driver_data member of the nested dev?

What should each driver_data member be used for?

In contrast platform_device and wmi_device only have the dev.driver_data and not 
the top level driver data.

Kind regards,

Werner Sembach

