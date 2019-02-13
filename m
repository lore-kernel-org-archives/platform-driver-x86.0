From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH] platform/x86: dell_rbu: fix lock imbalance in
 img_update_realloc
Date: Tue, 12 Feb 2019 21:56:30 -0600
Message-ID: <8d8a1ad0-2192-5293-9073-21d1916778ff@gmail.com>
References: <20190211130940.28206-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190211130940.28206-1-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, dvhart@infradead.org, andy@infradead.org
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>
List-Id: platform-driver-x86.vger.kernel.org



On 2/11/2019 7:09 AM, Christoph Hellwig wrote:
> We need to ensure rbu_data.lock is always held on return.
> 
> Fixes: 289790a3ea94 ("platform/x86: dell_rbu: stop abusing the DMA API")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/platform/x86/dell_rbu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/dell_rbu.c b/drivers/platform/x86/dell_rbu.c
> index 8104ca0c44ca..031c68903583 100644
> --- a/drivers/platform/x86/dell_rbu.c
> +++ b/drivers/platform/x86/dell_rbu.c
> @@ -436,6 +436,7 @@ static int img_update_realloc(unsigned long size)
>  	ordernum = get_order(size);
>  	image_update_buffer =
>  		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
> +	spin_lock(&rbu_data.lock);
>  	if (!image_update_buffer) {
>  		pr_debug("Not enough memory for image update:"
>  			"size = %ld\n", size);
> @@ -446,7 +447,6 @@ static int img_update_realloc(unsigned long size)
>  	if (WARN_ON_ONCE(img_buf_phys_addr > BIOS_SCAN_LIMIT))
>  		return -EINVAL; /* can't happen per definition */
>  
> -	spin_lock(&rbu_data.lock);
>  	rbu_data.image_update_buffer = image_update_buffer;
>  	rbu_data.image_update_buffer_size = size;
>  	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
> 

Acked-by: Stuart Hayes <stuart.w.hayes@gmail.com>
