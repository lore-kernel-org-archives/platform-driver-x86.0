From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v9 04/17] platform/x86: dell-wmi: allow 32k return size
 in the descriptor
Date: Tue, 17 Oct 2017 20:46:43 +0200
Message-ID: <20171017184643.pfsiracfb5pfz2ym@pali>
References: <cover.1508259916.git.mario.limonciello@dell.com>
 <68ba1b833a86f80b89eedfda8417ca0cc774d321.1508259916.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:56776 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763679AbdJQSqq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 Oct 2017 14:46:46 -0400
Content-Disposition: inline
In-Reply-To: <68ba1b833a86f80b89eedfda8417ca0cc774d321.1508259916.git.mario.limonciello@dell.com>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>

On Tuesday 17 October 2017 13:21:48 Mario Limonciello wrote:
> Some platforms this year will be adopting 32k WMI buffer, so don't
> complain when encountering those.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index ece2fe341f01..2578dff90a14 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -624,7 +624,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
>   * Vendor Signature          0       4    "DELL"
>   * Object Signature          4       4    " WMI"
>   * WMI Interface Version     8       4    <version>
> - * WMI buffer length        12       4    4096
> + * WMI buffer length        12       4    4096 or 32768
>   */
>  static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
>  {
> @@ -674,7 +674,7 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
>  		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%u)\n",
>  			buffer[2]);
>  
> -	if (buffer[3] != 4096)
> +	if (buffer[3] != 4096 && buffer[3] != 32768)
>  		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
>  			buffer[3]);
>  

Now, when buffer size is going to be exported to userspace and userspace
would need to prepare correct request, would not it better to allow any
positive buffer size? This would allow new machines to work even if
buffer size would be increased again (or decreased).

-- 
Pali Rohár
pali.rohar@gmail.com
