Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0AE1AFB35
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731412344; cv=none; b=DRHVcm5FKGP0nQ3EQtUu+6DW6/UH/eCm99txRT6PP8M5ACbcyAw2BsWTUFhQTEXGfFcEpgo2JFSXuCLRzYipo0vcZ4Pt7sBC6GZVCbNt39stCwxKc0H6AsHGzZwrdwiYOfz8j++LsvpO8maMNug6X3GhDX+lkQdaN2fiHCkSzcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731412344; c=relaxed/simple;
	bh=EwbE2g0YQMnkk1rT8tn68OgNsJTCctmQq2Fh5z7sjxI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PelTNnX1FvsJmnAx3grthWl+JYXf9w5ut9nM+AwwKlx2XiI+ycd5vx8n6OeNMb+DZ8pz7UI5/e5gOc1JRPoVTEeGAhUYptcixSIKAj0jfC0HovbvxXJD5ZamxHyk/+3nLxHvG0phHIF7iOd+FCM39A2y/0qP3NNkhq9bFwKNJkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=P8uV3OKH; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="P8uV3OKH"
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 89E632FC004A
	for <platform-driver-x86@vger.kernel.org>; Tue, 12 Nov 2024 12:52:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1731412338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=G7xrnsFm2/h4dfx/6+2BOaG/KfwhYRLde5jElS9+hf4=;
	b=P8uV3OKHP58ewABLLlzJZww2gQZjMZ7ZnZimHVYag1OsJ4a7CXRbrmrmr3f54EZ0EgnZeR
	Xx2aNswVfwdNMozeHBZ+3tcnnOT5sW6ppg8SEhhGotTG1uykbdNy8nOjN+Hc+3QOnFXa4r
	n6CLyZI4UOi+3pIJYf2EzuWIWXv6QP0=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <8847423c-22ec-4775-9119-de3e0ddb5204@tuxedocomputers.com>
Date: Tue, 12 Nov 2024 12:52:18 +0100
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
Subject: Why is wmi_bus_type not exported?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

quick learning question: Why is wmi_bus_type not exported unlike, for example, 
acpi_bus_type, and platform_bus_type?

Wanted to use bus_find_device_by_name in an acpi driver that might need 
additional infos from a wmi interface that might or might not be present.

Kind regards,

Werner Sembach

