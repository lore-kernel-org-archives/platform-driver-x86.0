From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
Subject: Re: [PATCH v10 04/15] platform/x86: dell-wmi: don't check length
 returned
Date: Thu, 19 Oct 2017 19:56:00 +0200
Message-ID: <20171019175600.nxcumbubsyjvd6pg@pali>
References: <cover.1508434513.git.mario.limonciello@dell.com>
 <5aaddb6951c34b4e2302062b53c7307f73287354.1508434513.git.mario.limonciello@dell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <5aaddb6951c34b4e2302062b53c7307f73287354.1508434513.git.mario.limonciello@dell.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mario Limonciello <mario.limonciello@dell.com>
Cc: dvhart@infradead.org, Andy Shevchenko <andy.shevchenko@gmail.com>, LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, Andy Lutomirski <luto@kernel.org>, quasisec@google.com, rjw@rjwysocki.net, mjg59@google.com, hch@lst.de, Greg KH <greg@kroah.com>, Alan Cox <gnomes@lxorguk.ukuu.org.uk>
List-Id: platform-driver-x86.vger.kernel.org

On Thursday 19 October 2017 12:50:07 Mario Limonciello wrote:
> This is intended to be variable and provided by the platform.
> Some platforms this year will be adopting a 32k WMI buffer, so don't
> complain when encountering those platforms or any other future changes.
> 
> Signed-off-by: Mario Limonciello <mario.limonciello@dell.com>
> Reviewed-by: Edward O'Callaghan <quasisec@google.com>

Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

> ---
>  drivers/platform/x86/dell-wmi.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell-wmi.c b/drivers/platform/x86/dell-wmi.c
> index b2bd396acac5..da4f629d0831 100644
> --- a/drivers/platform/x86/dell-wmi.c
> +++ b/drivers/platform/x86/dell-wmi.c
> @@ -624,7 +624,7 @@ static void dell_wmi_input_destroy(struct wmi_device *wdev)
>   * Vendor Signature          0       4    "DELL"
>   * Object Signature          4       4    " WMI"
>   * WMI Interface Version     8       4    <version>
> - * WMI buffer length        12       4    4096
> + * WMI buffer length        12       4    <length>
>   */
>  static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
>  {
> @@ -674,10 +674,6 @@ static int dell_wmi_check_descriptor_buffer(struct wmi_device *wdev)
>  		dev_warn(&wdev->dev, "Dell descriptor buffer has unknown version (%lu)\n",
>  			(unsigned long) buffer[2]);
>  
> -	if (buffer[3] != 4096)
> -		dev_warn(&wdev->dev, "Dell descriptor buffer has invalid buffer length (%d)\n",
> -			buffer[3]);
> -
>  	priv->interface_version = buffer[2];
>  	ret = 0;
>  

-- 
Pali Rohár
pali.rohar@gmail.com
