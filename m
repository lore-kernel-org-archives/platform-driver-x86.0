From: "Limonciello, Mario" <Mario.Limonciello-8PEkshWhKlo@public.gmane.org>
Subject: Re: [External] RE: [PATCH] platform/x86:
 thinkpad_acpi: performance mode interface
Date: Wed, 22 Jul 2020 19:46:45 +0000
Message-ID: <DM6PR19MB26360DE8FCA56BC132644F98FA790@DM6PR19MB2636.namprd19.prod.outlook.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
 <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
In-Reply-To: <b79e0359-536d-f496-a01e-fe4c4b7796cc-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=ibm-acpi-devel>
List-Post: <mailto:ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
List-Help: <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/ibm-acpi-devel>,
 <mailto:ibm-acpi-devel-request-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org?subject=subscribe>
Errors-To: ibm-acpi-devel-bounces-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org
To: Mark Pearson <markpearson-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>
Cc: "bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bberg-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org" <ibm-acpi-N3TV7GIv+o9fyO9Q7EP/yw@public.gmane.org>, "platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <platform-driver-x86-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org" <ibm-acpi-devel-5NWGOfrQmneRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Nitin Joshi <njoshi1-6jq1YtArVR3QT0dZR+AlfA@public.gmane.org>, "bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <bnocera-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: platform-driver-x86.vger.kernel.org

> 
> On 7/22/2020 2:46 PM, Limonciello, Mario wrote:
> <snip>
> >>
> >> +DYTC Thermal mode status and control
> >> +------------------------------------
> >> +
> >> +sysfs: dytc_perfmode
> >> +
> >> +Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
> >> firmware to
> >> +provide improved performance control.
> >> +
> >> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
> >> +operating mode between three different modes. This sysfs node provide a
> >> better
> >> +interface for user space to use
> >
> > So is userspace also notified in some way when you use the hotkey to change,
> or
> > is the event usurped by the EC?  Is this by the event
> TP_HKEY_EV_THM_CSM_COMPLETED?
> >
> I haven't added that yet - my aim with this patch was to get the sysfs
> API available. I'll look at adding the notification.

Yeah I just think touch the kernel/user ABI as atomically as possible
to avoid userspace to have to know 5.9 behaves this way and you need to poll for a value
and 5.10 you get a notification etc.

> 
> > You might consider to mention what other interfaces will conflict with this
> > and document them and/or artificially block them when this is loaded to
> prevent
> > such a conflict.
> I'm afraid I don't know what other interface will be conflicted with. Is
> there anything in particular I should be looking for? What did you have
> in mind?

Since it's not mentioned I can only guess your firmware implementation associated
with this code.  I would think for example that touching some PLx related MSR or
possibly RAPL interface might cause unexpected behaviors.

Assuming that's right kernel lockdown might prevent some of the MSR, but if you really
want user fully in control of this decision by one knob, you shouldn't let common
userspace tools like thermald, tuned, tlp or the like touch the related objects.

> 
> The firmware is operating by default and this patch is just providing
> user space with a way of determining the current mode and changing it by
> an alternate mechanism than hotkeys (I know some people dislike the
> hotkeys...)

In which case if the firmware preference is that it's user control, I think all
the more reason to block out those other things while offering this interface.

> 
> >
> <snip>
> >> +
> >> +The sysfs entry provides the ability to return the current status and to
> set
> >> the
> >> +desired mode. For example::
> >> +
> >> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> >> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> >> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> >
> > Doesn't this need ABI documentation submitted as part of the patch?
> OK - I'll need some help here as I'm not sure what I missed. Isn't that
> what this part of the patch is covering? If you can give me some
> pointers for what I should be putting where I'll do that.

I think it's common to document how your sysfs attributes work in a file in
Documentation/ABI/testing.  You can look at the format for some others
for examples.

> >
> <snip>
> 
> >> +
> >> +	if (perfmode == DYTC_MODE_BALANCE) {
> >> +		/* To get back to balance mode we just issue a reset command */
> >> +		err = dytc_command(DYTC_CMD_RESET, &output);
> >> +		if (err)
> >> +			return err;
> >> +	} else {
> >> +		/* Determine if we are in CQL mode. This alters the commands we do
> >> */
> >> +		err = dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
> >> +		if (err)
> >> +			return err;
> >> +
> >> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
> >> +			/* To set the mode we need to disable CQL first*/
> >> +			err = dytc_command(0x000F1001 /*Disable CQL*/, &output);
> >
> > Why not put 0x000F1001 and 0x001F1001 as defines at the top?
> Fair point - I will fix that.
> 
> >
> <snip>
> 
> >> +
> >> +	switch (perfmode) {
> >> +	case DYTC_MODE_PERFORM:
> >> +		/* High performance is only available in deskmode */
> >> +		if (funcmode == DYTC_FUNCTION_CQL)
> >> +			return snprintf(buf, PAGE_SIZE, "Medium (Reduced as lapmode
> >> active)\n");
> >> +		else
> >> +			return snprintf(buf, PAGE_SIZE, "High\n");
> >> +	case DYTC_MODE_QUIET:
> >> +		return snprintf(buf, PAGE_SIZE, "Low\n");
> >> +	case DYTC_MODE_BALANCE:
> >> +		return snprintf(buf, PAGE_SIZE, "Medium\n");
> >> +	default:
> >> +		return snprintf(buf, PAGE_SIZE, "Unknown (%d)\n", perfmode);
> >> +	}
> >> +}
> >
> > I think it's pretty confusing that you write "H/M/L" into this file, but you
> > get back a full string.
> The main reason here for the string is the need to let the user know
> they are operating in medium mode even though high has been configured -
> because the device is on their lap.
> My thinking was you can parse the first letter to get H/M/L but more
> information is available for the subtleties.
> I considered another letter but couldn't determine something that was
> obvious to a user (Lower case 'h' is my best candidate?) and decided a
> string was nicer.
> 
> I'd appreciate input from others as to the best thing to provide here.

My own personal opinion (and there may be others that offer different view
so don't take it authoritative):

If you're offering High/Medium/Low, you should accept an input of High/Medium/Low.
If you offer H/M/L you should accept H/M/L.

A good way to indicate the reduced mode would be to add an asterisk for medium.
So it could be:
Write: H/M/L
Read: H/M*/M/L

The actual decoding of the information can be placed in that Documentation file
I mentioned above.  In general a userspace tool will be making this pretty and
translated I would guess, so no need to do High versus high or Foo (bar) when
it could be Foo*

> 
> >
> >> +
> >> +static ssize_t dytc_perfmode_store(struct device *dev,
> >> +				   struct device_attribute *attr,
> >> +				   const char *buf, size_t count)
> >> +{
> >> +	int err;
> >> +
> >> +	switch (buf[0]) {
> >> +	case 'l':
> >> +	case 'L':
> >> +		err = dytc_perfmode_set(DYTC_MODE_QUIET);
> >> +		break;
> >> +	case 'm':
> >> +	case 'M':
> >> +		err = dytc_perfmode_set(DYTC_MODE_BALANCE);
> >> +		break;
> >> +	case 'h':
> >> +	case 'H':
> >> +		err = dytc_perfmode_set(DYTC_MODE_PERFORM);
> >> +		break;
> >> +	default:
> >> +		err = -EINVAL;
> >> +		pr_err("Unknown operating mode. Ignoring\n");
> >
> > Shouldn't this be dev_err?
> Ack - I will correct
> 
> <snip>
> >>
> >> +	/* Check DYTC is enabled and supports mode setting */
> >> +	dytc_mode_available = false;
> >> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
> >> +		/* Only DYTC v5.0 and later has this feature. */
> >> +		int dytc_version;
> >> +
> >> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
> >> +		if (dytc_version >= 5) {
> >> +			pr_info("DYTC thermal mode configuration available\n");
> >
> > I would argue this isn't useful to most people.
> > 1) You should decrease this to debug for use with dynamic debugging
> > 2) Output in the log what integer value you returned back in case of a need
> > to identify future firmware bugs.
> Agreed on both fronts. I will fix.

Similar to the pr_err vs dev_err, make sure you use the dev_dbg here instead of
pr_dbg.

> 
> >
> >> +			dytc_mode_available = true;
> >
> > I think you shouldn't set this flag until after the group is actually
> created.
> >
> Agreed. I will fix
> 
> Thanks for the feedback - very much appreciated.

Sure thing.
