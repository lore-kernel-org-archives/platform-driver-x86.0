From: Andy Lutomirski <luto@kernel.org>
Subject: Re: [PATCH 04/12] platform/x86: dell-smbios: Switch to a WMI-ACPI
 interface
Date: Wed, 27 Sep 2017 12:47:54 -0700
Message-ID: <c50c7b2a-7e91-a337-2442-6f0b60875491@kernel.org>
References: <cover.1505999739.git.mario.limonciello@dell.com>
 <4da87eb0d9722ed906615409586a8b4d7becd65c.1505999739.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751073AbdI0Trz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 27 Sep 2017 15:47:55 -0400
In-Reply-To: <4da87eb0d9722ed906615409586a8b4d7becd65c.1505999739.git.mario.limonciello@dell.com>
Content-Language: en-MW
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>, dvhart@infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, quasisec@google.com, pali.rohar@gmail.com

On 09/21/2017 06:57 AM, Mario Limonciello wrote:
> The driver currently uses an SMI interface which grants direct access
> to physical memory to the platform via a pointer.
> 
> Changing this to operate over WMI-ACPI will use an ACPI OperationRegion
> for a buffer of data storage when platform calls are performed.
> 
> This is a safer approach to use in kernel drivers as the platform will
> only have access to that OperationRegion.
> 
> As a result, this change removes the dependency on this driver on the
> dcdbas kernel module.
> 

> +	status = wmi_evaluate_method(DELL_WMI_SMBIOS_GUID,
> +				     0, 1, &input, &output);

It might be nice to add a wmidev_method_evaluate(struct wmi_device 
*wdev, ...) function to better aligh with the new world order.  The only 
reason I didn't do it is that I didn't convert any drivers that wanted it.
