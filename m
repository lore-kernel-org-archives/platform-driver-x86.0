From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v10 05/15] platform/x86: dell-wmi-descriptor: split WMI
 descriptor into it's own driver
Date: Thu, 19 Oct 2017 20:06:00 +0200
Message-ID: <20171019180600.6gp7ch3z3bgbkqwt@pali>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <d68852a032398142e5277137f2a18ff6a5bee999.1508434513.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wr0-f174.google.com ([209.85.128.174]:49894 "EHLO
        mail-wr0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752767AbdJSSGD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Oct 2017 14:06:03 -0400
Content-Disposition: inline
In-Reply-To: <d68852a032398142e5277137f2a18ff6a5bee999.1508434513.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Thursday 19 October 2017 12:50:08 Mario Limonciello wrote:
> +	priv->interface_version = buffer[2];
> +	priv->size = buffer[3];
> +	ret = 0;
> +	dev_set_drvdata(&wdev->dev, priv);
> +	list_add_tail(&priv->list, &wmi_list);

Still missing lock when changing wmi_list.

> +
> +	dev_dbg(&wdev->dev, "Detected Dell WMI interface version %lu and buffer size %lu\n",
> +		(unsigned long) priv->interface_version,
> +		(unsigned long) priv->size);
> +
> +out:
> +	kfree(obj);
> +	return ret;
> +}

-- 
Pali Rohár
pali.rohar@gmail.com
