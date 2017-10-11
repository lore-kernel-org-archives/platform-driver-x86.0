From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v7 04/15] platform/x86: dell-wmi: allow 32k return size
 in the descriptor
Date: Wed, 11 Oct 2017 18:31:59 +0200
Message-ID: <20171011163159.zhott3wh4fx6c76r@pali>
References: <cover.1507733291.git.mario.limonciello@dell.com>
 <d25311bf73fc7cc451e2ba58249a34ce54aaac83.1507733291.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d25311bf73fc7cc451e2ba58249a34ce54aaac83.1507733291.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>
List-Id: platform-driver-x86.vger.kernel.org

On Wednesday 11 October 2017 11:27:30 Mario Limonciello wrote:
> Some platforms this year will be adopting 32k WMI buffer, so don't
> complain when encountering those.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> ---
>  drivers/platform/x86/dell-wmi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index ece2fe341f01..c8c7f4f9326c 100644
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
> +	if (desc_buffer[3] != 4096 && desc_buffer[3] != 32768)

Looks like that desc_buffer is not declared.

>  		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%u)\n",
>  			buffer[3]);
>  

-- 
Pali Rohár
pali.rohar@gmail.com
