From: Guenter Roeck <linux@roeck-us.net>
Subject: Re: [RFT PATCH v3 1/2] compal-laptop: Fix leaking hwmon device
Date: Fri, 20 Feb 2015 08:50:28 -0800
Message-ID: <20150220165028.GD22752@roeck-us.net>
References: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55934 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752301AbbBTQu6 (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Fri, 20 Feb 2015 11:50:58 -0500
Received: from mailnull by bh-25.webhostbox.net with sa-checked (Exim 4.82)
	(envelope-from <linux@roeck-us.net>)
	id 1YOqn4-001xXh-1L
	for platform-driver-x86@vger.kernel.org; Fri, 20 Feb 2015 16:50:58 +0000
Content-Disposition: inline
In-Reply-To: <1424438015-3006-1-git-send-email-k.kozlowski@samsung.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Cc: Cezary Jackiewicz <cezary.jackiewicz@gmail.com>, Darren Hart <dvhart@infradead.org>, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Matthew Garrett <matthew.garrett@nebula.com>, stable@vger.kernel.org

On Fri, Feb 20, 2015 at 02:13:34PM +0100, Krzysztof Kozlowski wrote:
> The commit c2be45f09bb0 ("compal-laptop: Use
> devm_hwmon_device_register_with_groups") wanted to change the
> registering of hwmon device to resource-managed version. It mostly did
> it except the main thing - it forgot to use devm-like function so the
> hwmon device leaked after device removal or probe failure.
> 
> Signed-off-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>
> Fixes: c2be45f09bb0 ("compal-laptop: Use devm_hwmon_device_register_with_groups")
> Cc: <stable@vger.kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter
