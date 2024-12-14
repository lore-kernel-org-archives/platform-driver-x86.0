Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2435338DE0;
	Sat, 14 Dec 2024 10:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734173145; cv=none; b=m0+55PYDBvaX+z2DlojEFYQsl9W/UZPeA2Sc2gcYZZZGNe6ytNZxt1oOse+XU7fKhr7nGC1DO/DnyC9BIK2EySsJHlGrdLjlyeZqWv2n//CmUYp+HYPJht39RmRYAFcP3amO26OxhacCC7Nffy/noTmadzTOyi9RwJbxsTtcTaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734173145; c=relaxed/simple;
	bh=OnXWpLLwCl53Ii1gDoJk2KQDsWWSkBYK6ZIUAfCW0Hs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dscWTX4LGaTxGntBCisC9cmpIXTmdRL9dIUgbXxjRsozzHjnSoRBLIIU8ubXlcBXjEXT4CDMAj1yYDrKzYZSAHkD0wGbzNOcAy4/KYORpDrox0XoUqMHfFsG0nID8K9TectsTcPmMhakItqF6a5kCvxow+KqyIYaGzPgla7lkLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=L9FZvYV2; arc=none smtp.client-ip=220.197.31.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="L9FZvYV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=/Mz8e
	CJi+fLHjNC7SvrXgMLSiUUevypzCUZ0HwZ40L0=; b=L9FZvYV2eIf0hll/x+vHI
	rYmP/nDD6SvYAqYn2C6GMthTiIuQueOgBaYRbuvN9ZCM6b5jqIhdw14o9WdWaaks
	fjHGo7O21s0qlZfz/5RIP04Vq04UzHS0A0T1ES5klAY56VyL3tohy0bzcW9j9JP0
	67oFGagIZrvWVpsXr28VJc=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id _____wC3Lgy1YV1nsqYGAg--.26075S4;
	Sat, 14 Dec 2024 18:45:26 +0800 (CST)
From: David Wang <00107082@163.com>
To: w_armin@gmx.de
Cc: farhan.anwar8@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	jlee@suse.com,
	kuurtb@gmail.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	rayanmargham4@gmail.com
Subject: Re: [PATCH v4 5/5] platform/x86: acer-wmi: Ignore AC events
Date: Sat, 14 Dec 2024 18:45:05 +0800
Message-Id: <20241214104505.16025-1-00107082@163.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241210001657.3362-6-W_Armin@gmx.de>
References: <20241210001657.3362-6-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wC3Lgy1YV1nsqYGAg--.26075S4
X-Coremail-Antispam: 1Uf129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxUjSdyDUUUU
X-CM-SenderInfo: qqqrilqqysqiywtou0bp/xtbB0hO1qmddUp3R-wAAsF

May I suggest pr_info() this WMID_AC_EVENT event, there were discussions
about possible unstable adapter cord causing flood of events 8-0/1. The
logs may help identify the cause.


Thanks
David

 

