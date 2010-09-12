From: Carlos Corbacho <carlos@strangeworlds.co.uk>
Subject: Re: [PATCH 07/10] WMI: use separate list head for storing wmi blocks
Date: Sun, 12 Sep 2010 18:40:21 +0100
Message-ID: <201009121840.22082.carlos@strangeworlds.co.uk>
References: <20100826071442.7976.93972.stgit@localhost.localdomain> <20100826071514.7976.77547.stgit@localhost.localdomain>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <platform-driver-x86-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:57501 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751792Ab0ILRkw (ORCPT
	<rfc822;platform-driver-x86@vger.kernel.org>);
	Sun, 12 Sep 2010 13:40:52 -0400
Received: by wyf22 with SMTP id 22so5259453wyf.19
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Sep 2010 10:40:51 -0700 (PDT)
In-Reply-To: <20100826071514.7976.77547.stgit@localhost.localdomain>
Sender: platform-driver-x86-owner@vger.kernel.org
List-ID: <platform-driver-x86.vger.kernel.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Matthew Garrett <mjg@redhat.com>, platform-driver-x86@vger.kernel.org

On Thursday 26 August 2010 08:15:14 Dmitry Torokhov wrote:
> Do not abuse wmi_block structure to hold the head of list
> of blocks, use separate list_head for that.
> 
> Signed-off-by: Dmitry Torokhov <dtor@mail.ru>

Acked-by: Carlos Corbacho <carlos@strangeworlds.co.uk>

> ---
> 
>  drivers/platform/x86/wmi.c |   20 +++++++++-----------
>  1 files changed, 9 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index e9064fb..7b68dce 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -47,6 +47,7 @@ MODULE_LICENSE("GPL");
>  #define PREFIX "ACPI: WMI: "
> 
>  static DEFINE_MUTEX(wmi_data_lock);
> +static LIST_HEAD(wmi_block_list);
> 
>  struct guid_block {
>  	char guid[16];
> @@ -70,7 +71,6 @@ struct wmi_block {
>  	struct device *dev;
>  };
> 
> -static struct wmi_block wmi_blocks;
> 
>  /*
>   * If the GUID data block is marked as expensive, we must enable and
> @@ -246,7 +246,7 @@ static bool find_guid(const char *guid_string, struct
> wmi_block **out) wmi_parse_guid(guid_string, tmp);
>  	wmi_swap_bytes(tmp, guid_input);
> 
> -	list_for_each(p, &wmi_blocks.list) {
> +	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
>  		block = &wblock->gblock;
> 
> @@ -633,7 +633,7 @@ acpi_status wmi_get_event_data(u32 event, struct
> acpi_buffer *out) params[0].type = ACPI_TYPE_INTEGER;
>  	params[0].integer.value = event;
> 
> -	list_for_each(p, &wmi_blocks.list) {
> +	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
>  		gblock = &wblock->gblock;
> 
> @@ -721,7 +721,7 @@ static int wmi_create_devs(void)
>  	struct device *guid_dev;
> 
>  	/* Create devices for all the GUIDs */
> -	list_for_each(p, &wmi_blocks.list) {
> +	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
> 
>  		guid_dev = kzalloc(sizeof(struct device), GFP_KERNEL);
> @@ -758,7 +758,7 @@ static void wmi_remove_devs(void)
>  	struct device *guid_dev;
> 
>  	/* Delete devices for all the GUIDs */
> -	list_for_each(p, &wmi_blocks.list) {
> +	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
> 
>  		guid_dev = wblock->dev;
> @@ -797,7 +797,7 @@ static bool guid_already_parsed(const char
> *guid_string) struct wmi_block *wblock;
>  	struct list_head *p;
> 
> -	list_for_each(p, &wmi_blocks.list) {
> +	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
>  		gblock = &wblock->gblock;
> 
> @@ -811,7 +811,7 @@ static void free_wmi_blocks(void)
>  {
>  	struct wmi_block *wblock, *next;
> 
> -	list_for_each_entry_safe(wblock, next, &wmi_blocks.list, list) {
> +	list_for_each_entry_safe(wblock, next, &wmi_block_list, list) {
>  		list_del(&wblock->list);
>  		kfree(wblock);
>  	}
> @@ -876,7 +876,7 @@ static acpi_status parse_wdg(acpi_handle handle)
>  			wblock->handler = wmi_notify_debug;
>  			wmi_method_enable(wblock, 1);
>  		}
> -		list_add_tail(&wblock->list, &wmi_blocks.list);
> +		list_add_tail(&wblock->list, &wmi_block_list);
>  	}
> 
>  out_free_pointer:
> @@ -939,7 +939,7 @@ static void acpi_wmi_notify(struct acpi_device *device,
> u32 event) struct list_head *p;
>  	char guid_string[37];
> 
> -	list_for_each(p, &wmi_blocks.list) {
> +	list_for_each(p, &wmi_block_list) {
>  		wblock = list_entry(p, struct wmi_block, list);
>  		block = &wblock->gblock;
> 
> @@ -999,8 +999,6 @@ static int __init acpi_wmi_init(void)
>  {
>  	int result;
> 
> -	INIT_LIST_HEAD(&wmi_blocks.list);
> -
>  	if (acpi_disabled)
>  		return -ENODEV;

-- 
E-Mail: carlos@strangeworlds.co.uk
Web: strangeworlds.co.uk
GPG Key ID: 0x23EE722D
