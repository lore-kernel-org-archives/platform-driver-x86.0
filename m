Return-Path: <platform-driver-x86-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 907C9C433B4
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 17:18:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6A879611ED
	for <platform-driver-x86@archiver.kernel.org>; Thu, 20 May 2021 17:18:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231397AbhETRUS (ORCPT
        <rfc822;platform-driver-x86@archiver.kernel.org>);
        Thu, 20 May 2021 13:20:18 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.3]:6715 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231391AbhETRUR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 May 2021 13:20:17 -0400
Received: from [100.112.131.54] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-3.bemta.az-a.us-west-2.aws.symcld.net id 83/C9-28848-FF996A06; Thu, 20 May 2021 17:18:55 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleJIrShJLcpLzFFi42JJl3vFpvtv5rI
  EgwOt2hbd3XOZLN4cn85k8bljMovF6j0vmC0WfXzC5sDqMWnmDGaPeScDPd7vu8rm8XmTXABL
  FGtmXlJ+RQJrxpa9J1kL/oRVvJl9mLGB8bl7FyMXh5DAf0aJuT+XsEA4jxklphw4xdrFyMkhL
  FAk8fHGWTBbREBdYmpHDxuIzSxQIXFp2lQmiIbdjBK/vr4CK2IT0JbYsuUXWBGvgK3ErEWrwO
  IsAqoSZyYvZwSxRQXCJXZ3vGSCqBGUODnzCQuIzSlgJ3F5wXX2LkYOoAWaEut36UPsEpe49WQ
  +E4QtL7H97RxmEFtCQFHi/NReNgg7QaLn3yO2CYyCs5BMnYUwaRaSSbOQTFrAyLKK0SKpKDM9
  oyQ3MTNH19DAQNfQ0EjX0NhA18jUSC+xSjdRr7RYtzy1uEQXyC0v1iuuzE3OSdHLSy3ZxAiMm
  JSCpj87GP+++qB3iFGSg0lJlNfs/qIEIb6k/JTKjMTijPii0pzU4kOMMhwcShK8jDOWJQgJFq
  Wmp1akZeYAoxcmLcHBoyTCOwskzVtckJhbnJkOkTrFqCglzpsFkhAASWSU5sG1wRLGJUZZKWF
  eRgYGBiGegtSi3MwSVPlXjOIcjErCvDUgU3gy80rgpr8CWswEtNi9HGxxSSJCSqqBydn0W9Sh
  bTmqWVMZP5dv3Bi9aOrnsDUaL7od9aLsH094//LQHR9e6WXXzGdLJfa6K/ncYeZlyuCb/yArq
  /fxueC52+rtjt9Mq3vT9P11i0345pvdbK/nyDHXvPr7cV1Es31BxFoB6RvXpqgF/d8jnfxQY6
  NGKZvt7W7Rmwv32jFKtQg+DJ/MXBv18oaIuYnOu21h2eGfHLc087iosppZHLo0v+TS5gWNHw9
  xLM80Cy2Z1hb5+sBb20A+CbY2vVebL8ZUfUg5q7ffUDteMV9vVkHvdCahU9dnPKib5cWR++Xz
  Jd0+Po7Ow6vFz6oyMj4MrfJ85fk9em3Uzj/yO1vvzpp990N8YGS0Z6vT+yldSizFGYmGWsxFx
  YkAP0zj6JMDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-25.tower-336.messagelabs.com!1621531132!112355!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28064 invoked from network); 20 May 2021 17:18:54 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-25.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 May 2021 17:18:54 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id E138DBAC71A65D42FB50;
        Fri, 21 May 2021 01:18:50 +0800 (CST)
Received: from [10.46.192.105] (10.46.192.105) by reswpmail01.lenovo.com
 (10.62.32.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2176.2; Thu, 20 May
 2021 13:18:48 -0400
Subject: Re: [External] Re: [PATCH v2 3/3] platform/x86: think-lmi: Add WMI
 interface support on Lenovo platforms
To:     Hans de Goede <hdegoede@redhat.com>
CC:     <mgross@linux.intel.com>, <platform-driver-x86@vger.kernel.org>,
        <divya.bharathi@dell.com>, <prasanth.ksr@dell.com>
References: <markpearson@lenovo.com>
 <20210509015708.112766-1-markpearson@lenovo.com>
 <20210509015708.112766-3-markpearson@lenovo.com>
 <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <ac30f95e-8398-fb11-8c94-b50050a3f88f@lenovo.com>
Date:   Thu, 20 May 2021 13:18:48 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bbd0f3c9-63c3-2fbb-7712-ecb3131a4c0a@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.192.105]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for the review Hans,

On 2021-05-19 1:06 p.m., Hans de Goede wrote:
> Hi,
> 
> On 5/9/21 3:57 AM, Mark Pearson wrote:
<snip>
>>
>> diff --git a/Documentation/ABI/testing/sysfs-class-firmware-attributes b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> index 8ea59fea4..31d1becfa 100644
>> --- a/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> +++ b/Documentation/ABI/testing/sysfs-class-firmware-attributes
>> @@ -185,6 +185,17 @@ Description:
>>  					A write only value that when used in tandem with
>>  					current_password will reset a system or admin password.
>>  
>> +		encoding:
>> +					For platforms that require it (currently Lenovo) the
>> +					encoding method that is used. This can be either "ascii"
>> +					or "scancode". Default is set to "ascii"
>> +
>> +		kbdlang:
>> +					For platforms that require it (currently Lenovo only) the
>> +					keyboard language method that is used. This is generally a
>> +					two char code (e.g. "us", "fr", "gr") and may vary per platform.
>> +					Default is set to "us"
>> +
> 
> I should have caught this during my review of v1, these are Lenovo specific, so please prefix
> them with lenovo_ (the same is already done for dell specific sysfs attributes) and move them
> to a separate "Lenovo specific class extensions" part of the doc.
> 
No problem

<snip>

>>  
>>  What:		/sys/class/firmware-attributes/*/attributes/pending_reboot
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index b0e1e5f65..0511c54fc 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -639,6 +639,18 @@ config THINKPAD_ACPI_HOTKEY_POLL
>>  	  If you are not sure, say Y here.  The driver enables polling only if
>>  	  it is strictly necessary to do so.
>>  
>> +config THINKPAD_LMI
>> +	tristate "Lenovo WMI-based systems management driver"
>> +	default m
> 
> default n (or no default at all) please.
Ack

<snip>
>> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
>> new file mode 100644
>> index 000000000..2fa989e98
>> --- /dev/null
>> +++ b/drivers/platform/x86/think-lmi.c
>> @@ -0,0 +1,890 @@
<snip>
>> +
>> +/* ---- Authentication sysfs --------------------------------------------------------- */
>> +static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +					  char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>> +
>> +	if (setting->valid)
>> +		return sysfs_emit(buf, "1\n");
>> +	else
>> +		return sysfs_emit(buf, "0\n");
> 
> Maybe use:
> 
> 	sysfs_emit(buf, "%d\n", settings->valid);
> 
> instead?
Definitely :)

> 
> 
>> +}
>> +
>> +static struct kobj_attribute auth_is_pass_set = __ATTR_RO(is_enabled);
>> +
>> +static ssize_t current_password_store(struct kobject *kobj,
>> +				      struct kobj_attribute *attr,
>> +				      const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>> +	int length;
>> +
>> +	length = strlen(buf);
>> +	if (buf[length-1] == '\n')
>> +		length--;
>> +
>> +	if (length >= TLMI_PWD_MAXLEN)
>> +		return -EINVAL;
>> +
>> +	memcpy(setting->password, buf, length);
>> +	setting->password[length] = '\0';
>> +	return count;
>> +}
>> +
>> +static struct kobj_attribute auth_current_password = __ATTR_WO(current_password);
>> +
>> +static ssize_t new_password_store(struct kobject *kobj,
>> +				  struct kobj_attribute *attr,
>> +				  const char *buf, size_t count)
>> +{
>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>> +	char *p, *new_pwd;
>> +	char *auth_str;
>> +	int ret = 0, len;
>> +
>> +	if (!capable(CAP_SYS_ADMIN))
>> +		return -EPERM;
>> +
>> +	if (!tlmi_priv.can_set_bios_password)
>> +		return -EOPNOTSUPP;
>> +
>> +	new_pwd = kstrdup(buf, GFP_KERNEL);
>> +	if (!new_pwd)
>> +		return -ENOMEM;
>> +
>> +	p = strchr(new_pwd, '\n');
>> +	if (p)
>> +		*p = '\0';
>> +
>> +	if (strlen(new_pwd) > setting->maxlen) {
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	/* Format: 'PasswordType,CurrentPw,NewPw,Encoding,KbdLang;' */
>> +	len = strlen(setting->password) + strlen(encoding_options[setting->encoding])
>> +		+ strlen(setting->kbdlang) + 3 /* type */
>> +		+ strlen(new_pwd) + 6 /* punctuation and terminator*/;
>> +	auth_str = kzalloc(len, GFP_KERNEL);
>> +	snprintf(auth_str, len, "%s,%s,%s,%s,%s;",
>> +		 setting->pwd_type, setting->password, new_pwd,
>> +		 encoding_options[setting->encoding], setting->kbdlang);
>> +	ret = tlmi_simple_call(LENOVO_SET_BIOS_PASSWORD_GUID, auth_str);
> 
> So I guess on success any subsequent calls need to use the new password,
> so the user is expected to write the new password to the current_password
> file after changing the password this way?
> 
> I just checked the dell-wmi-sysman code and that does this:
> 
>         /* clear current_password here and use user input from wmi_priv.current_password */
>         if (!ret)
>                 memset(current_password, 0, MAX_BUFF);
> 
> Where current_password points to either the user or admin cached password,
> depending on which one is being changed.
> 
> So that seems to work the same way as what you are doing here (the user needs to
> write the new password to current_password after changing it through the
> new_password sysfs attribute). Can you add a patch to the patch-set documenting
> this in Documentation/ABI/testing/sysfs-class-firmware-attributes ?
> 
> Also you may want to consider clearing out the old cached password on success
> like the Dell code is doing.
> 
Would you have any objections/concerns if, on a successful password
update, this function just updates the stored password setting to the
new password.
Seems nicer from a user point of view then having to go and feed the
current_password field again.
e.g: strncpy(new_pwd, setting->password, TLMI_PWD_MAXLEN)

I know it would make Dell and Lenovo operate differently (I can add that
detail to the documentation) but it just feels like a nicer design.

<snip>

>> +
>> +static struct kobj_attribute auth_kbdlang = __ATTR_RW(kbdlang);
>> +
>> +{
>> +	if (strcmp(kobj->name, "Admin") == 0)
>> +		return sprintf(buf, "bios-admin\n");
>> +	else if (strcmp(kobj->name, "System") == 0)
>> +		return sprintf(buf, "power-on\n");
>> +	return -EIO;
>> +}
> 
> IMHO it would be nice to add a "const char *role" to struct tlmi_pwd_setting and
> then change this to:
> 
>> +static ssize_t encoding_show(struct kobject *kobj, struct kobj_attribute *attr,
>> +			 char *buf)
>> +{
>> +	struct tlmi_pwd_setting *setting = container_of(kobj, struct tlmi_pwd_setting, kobj);
>> +
>> +	return sysfs_emit(buf, "%s\n", setting->role);
>> +}
> 
> That would make this function consistent with the other password related functions.
Agreed - I'll make that change

<snip>

>> +static ssize_t current_value_store(struct kobject *kobj,
>> +		struct kobj_attribute *attr,
>> +		const char *buf, size_t count)
>> +{
>> +	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);
>> +	int alloc_len, auth_len = 0;
>> +	int str_ix = 0;
>> +	char *auth_str = NULL;
>> +	char *set_str, *new_setting, *p;
>> +	int ret;
>> +
>> +	if (!tlmi_priv.can_set_bios_settings)
>> +		return -EOPNOTSUPP;
>> +
>> +	new_setting = kstrdup(buf, GFP_KERNEL);
>> +	if (!new_setting)
>> +		return -ENOMEM;
>> +	p = strchr(new_setting, '\n');
>> +	if (p)
>> +		*p = '\0';
>> +
>> +	alloc_len = strlen(setting->display_name) + 3 + strlen(new_setting);
>> +
>> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password) {
>> +		auth_len += strlen(tlmi_priv.pwd_admin->password) + 1
>> +			+ strlen(encoding_options[tlmi_priv.pwd_admin->encoding]) + 1
>> +			+ strlen(tlmi_priv.pwd_admin->kbdlang) + 1 + 1;
>> +		auth_str = kmalloc(auth_len, GFP_KERNEL);
>> +		if (!auth_str) {
>> +			ret = -ENOMEM;
>> +			goto out;
> 
> You end-up kfree-ing set_str here without it being initialized (compiler warning?)
> Please just initialize all 3 strings which you kfree at the end to NULL, I know
> this is not necessary for at least the new_setting string but it makes it easier
> for someone reading the code to verify that the kfree() does not happens on
> an uninitialized pointer.

Agreed. Thanks.
> 
>> +		}
>> +
>> +		sprintf(auth_str, "%s,%s,%s;",
>> +				tlmi_priv.pwd_admin->password,
>> +				encoding_options[tlmi_priv.pwd_admin->encoding],
>> +				tlmi_priv.pwd_admin->kbdlang);
>> +		alloc_len += auth_len;
>> +	}
>> +
>> +	set_str = kmalloc(alloc_len, GFP_KERNEL);
>> +	if (!set_str) {
>> +		ret = -ENOMEM;
>> +		goto out;
>> +	}
>> +
>> +	str_ix += sprintf(set_str, "%s,%s", setting->display_name, new_setting);
>> +
>> +	if (tlmi_priv.pwd_admin->valid && tlmi_priv.pwd_admin->password)
> 
> Maybe use:
> 
> 	if (auth_str) 
> 
> here? This way if the condition of the above if block ever changes, you can't
> end up passing a NULL auth_Str to the sprintf.

Agreed - makes sense
<snip>

>> +
>> +static const struct sysfs_ops tlmi_kobj_sysfs_ops = {
>> +	.show	= tlmi_attr_show,
>> +	.store	= tlmi_attr_store,
>> +};
>> +
>> +static struct kobj_type attr_name_ktype = {
>> +	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
>> +};
> 
> You need to re-add a release function here, sorry I was not clear
> about that in my review of v1. Since you do a kobject_put and not a
> direct kfree() on cleanup, you need to define a release function to
> do the actual free once the refcount drops to 0.
> 
> And since you have 2 kind of structs embedding the kobjects you will
> need 2 release functions:
> 
> static void tmli_attr_setting_release(struct kobject *kobj)
> {
> 	struct tlmi_attr_setting *setting = container_of(kobj, struct tlmi_attr_setting, kobj);
> 
> 	kfree(setting);
> }
> 
> static void tmli_pwd_setting_release(struct kobject *kobj)
> {
> 	struct tlmi_pwd_setting *pwd = container_of(kobj, struct tlmi_pwd_setting, kobj);
> 
> 	kfree(pwd);
> }
> 
> And then have 2 kobject-types:
> 
> static struct kobj_type tmli_attr_setting_ktype = {
> 	.release	= tmli_attr_setting_release,
> 	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
> };
> 
> static struct kobj_type tmli_pwd_setting_ktype = {
> 	.release	= tmli_pwd_setting_release,
> 	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
> };
> 
> And use the right type when creating the objects.
> 
Ah - got it. I had a feeling I was missing something here. Thanks!

<snip>

>> +
>> +module_wmi_driver(tlmi_driver);
>> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
>> new file mode 100644
>> index 000000000..2c1484304
>> --- /dev/null
>> +++ b/drivers/platform/x86/think-lmi.h
>> @@ -0,0 +1,73 @@
<snip>>> +
>> +/* password setting details */
>> +struct tlmi_pwd_setting {
>> +	struct kobject kobj;
>> +	bool valid;
>> +	char display_name[TLMI_PWDTYPE_MAXLEN];
>> +	char password[TLMI_PWD_MAXLEN];
>> +	char pwd_type[TLMI_PWDTYPE_LEN];
> 
> Note you can just make this a "const char *" and init it like this:
> 
> 	pwd_type = "pop";
> 
> The "pop" string will be part of the const data section so its
> address will still be valid after the function has exited.
> 
Ack

