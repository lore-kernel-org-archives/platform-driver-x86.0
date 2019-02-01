From: Stuart Hayes <stuart.w.hayes@gmail.com>
Subject: Re: [PATCH] dell_rbu: stop abusing the DMA API
Date: Fri, 1 Feb 2019 12:28:46 -0600
Message-ID: <4fce2a6c-2e57-bc29-0dca-8ed3bef95333@gmail.com>
References: <20190129073409.7247-1-hch@lst.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190129073409.7247-1-hch@lst.de>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Christoph Hellwig <hch@lst.de>, dvhart@infradead.org
Cc: andy@infradead.org, platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: platform-driver-x86.vger.kernel.org


On 1/29/2019 1:34 AM, Christoph Hellwig wrote:
> For some odd reason dell_rbu actually seems to want the physical and
> not a bus address for the allocated buffer.  Lets assume that actually
> is correct given that it is BIOS-related and that is a good source
> of insanity.  In that case we should not use dma_alloc_coherent with
> a NULL device to allocate memory, but use GFP_DMA32 to stay under
> the 32-bit BIOS limit.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/platform/x86/dell_rbu.c | 52 ++++++++++-----------------------
>  1 file changed, 15 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell_rbu.c b/drivers/platform/x86/dell_rbu.c
> index ccefa84f7305..fba7d96c1714 100644
> --- a/drivers/platform/x86/dell_rbu.c
> +++ b/drivers/platform/x86/dell_rbu.c
> @@ -59,7 +59,6 @@ static struct _rbu_data {
>  	unsigned long image_update_buffer_size;
>  	unsigned long bios_image_size;
>  	int image_update_ordernum;
> -	int dma_alloc;
>  	spinlock_t lock;
>  	unsigned long packet_read_count;
>  	unsigned long num_packets;
> @@ -89,7 +88,6 @@ static struct packet_data packet_data_head;
>  
>  static struct platform_device *rbu_device;
>  static int context;
> -static dma_addr_t dell_rbu_dmaaddr;
>  
>  static void init_packet_head(void)
>  {
> @@ -380,12 +378,8 @@ static void img_update_free(void)
>  	 */
>  	memset(rbu_data.image_update_buffer, 0,
>  		rbu_data.image_update_buffer_size);
> -	if (rbu_data.dma_alloc == 1)
> -		dma_free_coherent(NULL, rbu_data.bios_image_size,
> -			rbu_data.image_update_buffer, dell_rbu_dmaaddr);
> -	else
> -		free_pages((unsigned long) rbu_data.image_update_buffer,
> -			rbu_data.image_update_ordernum);
> +	free_pages((unsigned long) rbu_data.image_update_buffer,
> +		rbu_data.image_update_ordernum);
>  
>  	/*
>  	 * Re-initialize the rbu_data variables after a free
> @@ -394,7 +388,6 @@ static void img_update_free(void)
>  	rbu_data.image_update_buffer = NULL;
>  	rbu_data.image_update_buffer_size = 0;
>  	rbu_data.bios_image_size = 0;
> -	rbu_data.dma_alloc = 0;
>  }
>  
>  /*
> @@ -410,10 +403,8 @@ static void img_update_free(void)
>  static int img_update_realloc(unsigned long size)
>  {
>  	unsigned char *image_update_buffer = NULL;
> -	unsigned long rc;
>  	unsigned long img_buf_phys_addr;
>  	int ordernum;
> -	int dma_alloc = 0;
>  
>  	/*
>  	 * check if the buffer of sufficient size has been
> @@ -444,36 +435,23 @@ static int img_update_realloc(unsigned long size)
>  
>  	ordernum = get_order(size);
>  	image_update_buffer =
> -		(unsigned char *) __get_free_pages(GFP_KERNEL, ordernum);
> -
> -	img_buf_phys_addr =
> -		(unsigned long) virt_to_phys(image_update_buffer);
> -
> -	if (img_buf_phys_addr > BIOS_SCAN_LIMIT) {
> -		free_pages((unsigned long) image_update_buffer, ordernum);
> -		ordernum = -1;
> -		image_update_buffer = dma_alloc_coherent(NULL, size,
> -			&dell_rbu_dmaaddr, GFP_KERNEL);
> -		dma_alloc = 1;
> -	}
> -
> -	spin_lock(&rbu_data.lock);
> -
> -	if (image_update_buffer != NULL) {
> -		rbu_data.image_update_buffer = image_update_buffer;
> -		rbu_data.image_update_buffer_size = size;
> -		rbu_data.bios_image_size =
> -			rbu_data.image_update_buffer_size;
> -		rbu_data.image_update_ordernum = ordernum;
> -		rbu_data.dma_alloc = dma_alloc;
> -		rc = 0;
> -	} else {
> +		(unsigned char *)__get_free_pages(GFP_DMA32, ordernum);
> +	if (!image_update_buffer) {
>  		pr_debug("Not enough memory for image update:"
>  			"size = %ld\n", size);
> -		rc = -ENOMEM;
> +		return -ENOMEM;
>  	}
>  
> -	return rc;
> +	img_buf_phys_addr = (unsigned long)virt_to_phys(image_update_buffer);
> +	if (WARN_ON_ONCE(img_buf_phys_addr > BIOS_SCAN_LIMIT))
> +		return -EINVAL; /* can't happen per defintion */
> +
> +	spin_lock(&rbu_data.lock);
> +	rbu_data.image_update_buffer = image_update_buffer;
> +	rbu_data.image_update_buffer_size = size;
> +	rbu_data.bios_image_size = rbu_data.image_update_buffer_size;
> +	rbu_data.image_update_ordernum = ordernum;
> +	return 0;
>  }
>  
>  static ssize_t read_packet_data(char *buffer, loff_t pos, size_t count)
> 

Acked-by: Stuart Hayes <stuart.w.hayes@gmail.com>
