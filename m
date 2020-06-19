From: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Subject: Re: [External] Re: [RESEND PATCH v2] platform/x86:
 thinkpad_acpi: lap or desk mode interface
Date: Fri, 19 Jun 2020 11:02:48 -0400
Message-ID: <89c38303-9463-d671-1f86-e0c6a433748c@lenovo.com>
References: <markpearson@lenovo.com>
 <20200617180937.14949-1-markpearson@lenovo.com>
 <1905013469.24563660.1592574774373.JavaMail.zimbra@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <1905013469.24563660.1592574774373.JavaMail.zimbra-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Bastien Nocera <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: Sugumaran <slacshiminar-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org, ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: platform-driver-x86.vger.kernel.org

Hi Bastien

On 6/19/2020 9:52 AM, Bastien Nocera wrote:
> Hey Mark,
> 
> ----- Original Message -----
<snip>
>>   
>> +/*************************************************************************
>> + * DYTC subdriver, for the Lenovo performace mode feature
>> + */
> 
> I don't think this should mention the performance mode, as it's a lap/table
> detection mode. Do we need to call that "DYTC"? "lapmode"? "lap_detection"?
> Or does the DYTC interface offer more functionality that we'd export in the
> future?
> 
I've just noticed that I can't spell performance either which is
embarrassing :)

Originally I developed this code for a thermal modes feature - but
this portion of it is also needed for WWAN so we pulled out just this
piece as the first bit to get in. Having WWAN available for users is
more important than the thermal mode interface (there are a lot of users
who want WWAN working properly on our laptops).

So...yes, DYTC does offer more functionality and I'm planning on
proposing the thermal patch as soon as this one makes it through, but I
agree that in the context of this patch the comment is misleading. I
will clean that up for this version.

>> +
>> +#define DYTC_CMD_GET      2 /*To get current IC function and mode*/
> 
> For this comment and all the ones below, space after "/*" and before "*/"
> 
Ack

>> +#define DYTC_GET_ENABLE_MASK  0x1 /*0 = disabled, 1 = enabled*/
> 
> Is that necessary?
> 
Another hangover in that the other fields used for the thermal mode have
more interesting masks and this fitted in with that. I can remove for
now if it's really a problem.

>> +#define DYTC_GET_LAPMODE_SHIFT 17
> 
> You'd probably want to call this "bit" rather than shift. We shift it to read
> the value, but 17 is the bit's position. (See BIT() usage in the driver)
> 
Ack
> Do you want to add a comment here? Is there anything else that could be
> documented (the other bits, which versions of firmware would have that, if
> there's a publicly available version, or which hardware if publicly available)
> 
So what is the preference normally? More pieces will definitely be made
public when I release the thermal mode updates but I assumed we kept
things related only to the code used. I can add more detail here if that
helps. Not trying to hide anything :)

>> +static int  dytc_lapmode;
>> +static void dytc_lapmode_notify_change(void)
>> +{
>> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
>> +			"dytc_lapmode");
>> +}
>> +
>> +static int dytc_command(int command)
>> +{
>> +	acpi_handle dytc_handle;
>> +	int output;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
>> +		/*Platform doesn't support DYTC*/
>> +		return -ENODEV;
>> +	}
>> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", command))
>> +		return -EIO;
>> +	return output;
>> +}
>> +
>> +static int dytc_lapmode_get(void)
>> +{
>> +	int output;
>> +
>> +	output = dytc_command(DYTC_CMD_GET);
>> +	if ((output == -ENODEV) || (output == -EIO))
>> +		return output;
>> +
>> +	return ((output >> DYTC_GET_LAPMODE_SHIFT) &
>> +				DYTC_GET_ENABLE_MASK);
> 
> Use BIT() instead? eg.
> return (output & BIT(DYTC_GET_LAPMODE_SHIFT));
> 
Ack
>> +}
>> +
>> +static void dytc_lapmode_refresh(void)
>> +{
>> +	int new_state;
>> +
>> +	new_state = dytc_lapmode_get();
>> +	if ((new_state == -ENODEV) || (new_state == -EIO))
>> +		return;
> 
> You could also return early if "dytc_lapmode == new_state".
> 
Good point.

> Rest looks good to me.
> 
Great - thanks for the review. I'll prepare the updates and if there's
any feedback on the questions above please let me know

Mark
